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
    
    @IBAction func confirmEditProfile(_ sender: Any) {
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
