//
//  ConfirmSignUpViewController.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 5/30/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit

class ConfirmSignUpViewController: UIViewController {

    @IBOutlet weak var confirmFullName: UILabel!
    @IBOutlet weak var confirmUsername: UILabel!
    @IBOutlet weak var confirmEmail: UILabel!
    @IBOutlet weak var confirmPassword: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullnameDB = UserDefaults.standard.string(forKey: "name")
        let usernameDB = UserDefaults.standard.string(forKey: "username")
        let emailDB = UserDefaults.standard.string(forKey: "email")
        let passwordDB = UserDefaults.standard.string(forKey: "password")
        
        confirmFullName.text = fullnameDB
        confirmUsername.text = usernameDB
        confirmEmail.text = emailDB
        confirmPassword.text = passwordDB

    }
}
