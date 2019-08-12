//
//  ConfirmSignUpViewController.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 5/30/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class ConfirmSignUpViewController: UIViewController {
    
    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    

    @IBOutlet weak var confirmFullName: UILabel!
    @IBOutlet weak var confirmUsername: UILabel!
    @IBOutlet weak var confirmEmail: UILabel!
    @IBOutlet weak var confirmPassword: UILabel!

    let userDefaults = UserDefaults.standard

    @IBAction func confirm(sender: AnyObject) {
        
        userDefaults.set(0, forKey:"totalBoxesDB")
        userDefaults.set(0, forKey:"totalTimesDB")
        userDefaults.set(0, forKey:"totalMoneyDB")
        
        let fullnameDB = UserDefaults.standard.string(forKey: "name")!
        let usernameDB = UserDefaults.standard.string(forKey: "currentUser")!
        let emailDB = UserDefaults.standard.string(forKey: "email")!
        let passwordDB = UserDefaults.standard.string(forKey: "password")!
        
        let ref = Database.database().reference()
        ref.child("username").child(usernameDB).setValue(["name":fullnameDB, "username":usernameDB, "email":emailDB, "totalItems":0, "totalTimes":0, "number of volunteers":0])
        
        
        // email authorization
        Auth.auth().createUser(withEmail: emailDB, password: passwordDB) { authResult, error in
            if (error != nil) {
                self.displayAlert(message: "Could not register new user")
            }
        }
        
        
        
        let tempAllUsers: [String]!
        tempAllUsers = UserDefaults.standard.value(forKey: "allUsers") as? [String]
        var allUsers: [String] = tempAllUsers
        
        // update allUsers
        allUsers.append(usernameDB)
        userDefaults.set(allUsers, forKey:"allUsers")
        
        var emailList = [String]()
        for x in allUsers {
            let ref = Database.database().reference()
            ref.child("username/" + x + "/email").observeSingleEvent(of: .value) {
                (snapshot) in
                var individualEmail: String
                individualEmail = snapshot.value as! String
                emailList.append(individualEmail)
                self.userDefaults.set(emailList, forKey:"emailList")
                return
            }
        }
        //update emailList
        var tempAllEmail: [String]!
        tempAllEmail = UserDefaults.standard.value(forKey: "emailList") as? [String]
        tempAllEmail.append(emailDB)
        UserDefaults.standard.set(tempAllEmail, forKey:"emailList")

        performSegue(withIdentifier: "confirmSignUp", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullnameDB = UserDefaults.standard.string(forKey: "name")
        let usernameDB = UserDefaults.standard.string(forKey: "currentUser")
        let emailDB = UserDefaults.standard.string(forKey: "email")
        let passwordDB = UserDefaults.standard.string(forKey: "password")
        
        confirmFullName.text = fullnameDB
        confirmUsername.text = usernameDB
        confirmEmail.text = emailDB
        confirmPassword.text = passwordDB
        

        

        
    }
}
