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

class ConfirmSignUpViewController: UIViewController {

    @IBOutlet weak var confirmFullName: UILabel!
    @IBOutlet weak var confirmUsername: UILabel!
    @IBOutlet weak var confirmEmail: UILabel!
    @IBOutlet weak var confirmPassword: UILabel!

    let userDefaults = UserDefaults.standard

    @IBAction func confirm(_ sender: Any) {
        userDefaults.set(0, forKey:"totalBoxesDB")
        userDefaults.set(0, forKey:"totalTimesDB")
        userDefaults.set(0, forKey:"totalMoneyDB")
    }
    
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
        

        
        let ref = Database.database().reference()
        ref.child("username").child(usernameDB!).setValue(["name":fullnameDB, "username":usernameDB, "email":emailDB, "totalBoxes":0, "totalTimes":0, "number of volunteers":0])
    }
}
