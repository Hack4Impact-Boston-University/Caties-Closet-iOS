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
        
        let newemail = UserDefaults.standard.string(forKey: "email")
        let newPassword = UserDefaults.standard.string(forKey: "password")
        
        // delete previous email authorization
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let error = error {
                // An error happened.
            } else {
                // Account deleted.
            }
        }
        
        // email authorization
        Auth.auth().createUser(withEmail: newemail!, password: newPassword!) { authResult, error in
            if (error != nil) {
                self.displayAlert(message: "Could not update account")
            }
        }
        
        let ref = Database.database().reference()
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/name").setValue(UserDefaults.standard.string(forKey: "name"))
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/email").setValue(UserDefaults.standard.string(forKey: "email"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullnameDB = UserDefaults.standard.string(forKey: "name")
        let usernameDB = UserDefaults.standard.string(forKey: "currentUser")
        let emailDB = UserDefaults.standard.string(forKey: "email")
        let passwordDB = UserDefaults.standard.string(forKey: "password")
        
        
         confirmNewFullName.text = fullnameDB
         confirmNewUsername.text = usernameDB
         confirmNewEmail.text = emailDB
         confirmNewPassword.text = passwordDB
        
    }
}
