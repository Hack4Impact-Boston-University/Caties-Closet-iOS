//
//  ProfileViewController.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 5/30/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    
     @IBOutlet weak var confirmNewFullName: UILabel!
     @IBOutlet weak var confirmNewUsername: UILabel!
    @IBOutlet weak var confirmNewEmail: UILabel!
    @IBOutlet weak var confirmNewPassword: UILabel!
    
    
    @IBAction func confirmEditProfile(_ sender: Any) {
        
        let newemail = UserDefaults.standard.string(forKey: "newemail")
        let newPassword = UserDefaults.standard.string(forKey: "newpassword")
        
        // delete previous email authorization
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let error = error {
                // An error happened.
            } else {
                // Account deleted.
            }
            print("user deleted")
        }
        
        print("new email:",newemail)
        // email authorization
        Auth.auth().createUser(withEmail: newemail!, password: newPassword!) { authResult, error in
            if (error != nil) {
                self.displayAlert(message: "Could not update account")
            }
            print("user added")
        }
        
        let ref = Database.database().reference()
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/name").setValue(UserDefaults.standard.string(forKey: "newname"))
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/email").setValue(UserDefaults.standard.string(forKey: "newemail"))
        
        
        // update emailList
        let tempAllUsers: [String]!
        tempAllUsers = UserDefaults.standard.value(forKey: "allUsers") as? [String]
        var allUsers: [String] = tempAllUsers
        var emailList = [String]()
        for x in allUsers {
            let ref = Database.database().reference()
            ref.child("username/" + x + "/email").observeSingleEvent(of: .value) {
                (snapshot) in
                var individualEmail: String
                individualEmail = snapshot.value as! String
                emailList.append(individualEmail)
                UserDefaults.standard.set(emailList, forKey:"emailList")
                return
            }
        }
        let oldEmail = UserDefaults.standard.value(forKey: "email") as? String
        var tempAllEmail: [String]!
        tempAllEmail = UserDefaults.standard.value(forKey: "emailList") as? [String]
        var allEmail: [String] = tempAllEmail
        for (index, element) in allEmail.enumerated() {
            if (element == oldEmail) {
                allEmail.remove(at: index)
            }
        }
        allEmail.append(newemail ?? "")
        UserDefaults.standard.set(allEmail, forKey:"emailList")

        UserDefaults.standard.set(confirmNewFullName.text, forKey:"name")
        UserDefaults.standard.set(newemail, forKey:"email")
        UserDefaults.standard.set(newPassword, forKey:"password")
        UserDefaults.standard.synchronize()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullnameDB = UserDefaults.standard.string(forKey: "newname")
        let usernameDB = UserDefaults.standard.string(forKey: "currentUser")
        let emailDB = UserDefaults.standard.string(forKey: "newemail")
        let passwordDB = UserDefaults.standard.string(forKey: "newpassword")
        
        
         confirmNewFullName.text = fullnameDB
         confirmNewUsername.text = usernameDB
         confirmNewEmail.text = emailDB
         confirmNewPassword.text = passwordDB
        
    }
}
