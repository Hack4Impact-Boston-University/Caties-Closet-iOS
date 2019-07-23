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
    
    
     @IBOutlet weak var confirmNewFullName: UILabel!
     @IBOutlet weak var confirmNewUsername: UILabel!
     @IBOutlet weak var confirmNewEmail: UILabel!
     @IBOutlet weak var confirmNewPassword: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullnameDB = UserDefaults.standard.string(forKey: "name")
        let usernameDB = UserDefaults.standard.string(forKey: "username")
        let emailDB = UserDefaults.standard.string(forKey: "email")
        let passwordDB = UserDefaults.standard.string(forKey: "password")
        
        
         confirmNewFullName.text = fullnameDB
         confirmNewUsername.text = usernameDB
         confirmNewEmail.text = emailDB
         confirmNewPassword.text = passwordDB
        
    }
    
    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOut", sender: self)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            let alertController = UIAlertController(title: "Could not Sign out user", message:
                "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
