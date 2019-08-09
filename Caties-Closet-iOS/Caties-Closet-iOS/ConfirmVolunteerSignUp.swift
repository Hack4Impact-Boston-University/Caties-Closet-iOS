//
//  ConfirmVolunteerSignUp.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 8/9/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth

class ConfirmVolunteerSignUp: UIViewController {

    

    @IBAction func confirmVolunteerSignUp(_ sender: Any) {
        
        let volunteerFirstName = UserDefaults.standard.string(forKey: "volunteerFirstName")
        let volunteerMiddleName = UserDefaults.standard.string(forKey: "volunteerMiddleName")
        let volunteerLastName = UserDefaults.standard.string(forKey: "volunteerLastName")
        let volunteerEmail = UserDefaults.standard.string(forKey: "volunteerEmail")
        let volunteerGender = UserDefaults.standard.string(forKey: "volunteerGender")
        let volunteerLocation = UserDefaults.standard.string(forKey: "volunteerLocation")
        let usernameDB = UserDefaults.standard.string(forKey: "currentUser")
        var numVolunteers = UserDefaults.standard.integer(forKey: "numVolunteers")
        
        numVolunteers += 1
        
        let ref = Database.database().reference()
        ref.child("volunteer").child(usernameDB!+String(numVolunteers)).setValue(["first name":volunteerFirstName, "middle name":volunteerMiddleName, "last name":volunteerLastName, "email":volunteerEmail, "gender":volunteerGender, "preferred location":volunteerLocation])
        ref.child("username/"+(usernameDB ?? "")+"/number of volunteers").setValue(numVolunteers)

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()
        ref.child("username/" + UserDefaults.standard.string(forKey: "currentUser")! + "/number of volunteers").observeSingleEvent(of: .value) {
            (snapshot) in
            let numVolunteers = snapshot.value as? Int
            UserDefaults.standard.set(numVolunteers!, forKey:"numVolunteers")
        }
    }
}
