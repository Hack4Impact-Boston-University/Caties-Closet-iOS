//
//  ViewProfile.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 8/10/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class ViewProfile: UIViewController {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var password: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let usernameDB = UserDefaults.standard.string(forKey: "currentUser")
        let emailDB = UserDefaults.standard.string(forKey: "email")
        let passwordDB = UserDefaults.standard.string(forKey: "password")
        let fullnameDB = UserDefaults.standard.string(forKey: "name")

        fullName.text = fullnameDB
        username.text = usernameDB
        email.text = emailDB
        password.text = passwordDB
        
    }
}
