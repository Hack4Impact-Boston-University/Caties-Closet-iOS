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
        ref.child("username").child(usernameDB).setValue(["name":fullnameDB, "username":usernameDB, "email":emailDB, "totalBoxes":0, "totalTimes":0, "number of volunteers":0])
        
        
        // email authorization
        Auth.auth().createUser(withEmail: emailDB, password: passwordDB) { authResult, error in
            if (error != nil) {
                self.displayAlert(message: "Could not register new user")
            }
        }
        
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
