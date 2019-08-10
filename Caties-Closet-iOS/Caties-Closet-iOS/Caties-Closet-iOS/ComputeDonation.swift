//
//  ComputeDonation.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 6/6/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ComputeDonation : UIViewController {
    
    
    var totalTimes = UserDefaults.standard.integer(forKey: "totalTimesDB")
    var totalBoxes = UserDefaults.standard.integer(forKey: "totalBoxesDB")

    
    let userDefaults = UserDefaults.standard

    
    @IBAction func pickUpDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.synchronize()

        let ref = Database.database().reference()
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalBoxes").setValue(totalBoxes)
        
        
        
        // donation pickup info list
        let name_pickUp =         UserDefaults.standard.string(forKey: "name_pickUp")
        let phone_pickUp =         UserDefaults.standard.string(forKey: "phone_pickUp")
        let email_pickUp =         UserDefaults.standard.string(forKey: "email_pickUp")
        let address1_pickUp =         UserDefaults.standard.string(forKey: "address1_pickUp")
        let address2_pickUp =         UserDefaults.standard.string(forKey: "address2_pickUp")
        let city_pickUp =         UserDefaults.standard.string(forKey: "city_pickUp")
        let zipCode_pickUp =         UserDefaults.standard.string(forKey: "zipCode_pickUp")
        let country_pickUp =         UserDefaults.standard.string(forKey: "country_pickUp")
        let addtionalInfo_pickUp =         UserDefaults.standard.string(forKey: "addtionalInfo_pickUp")
        
        
        let currentUsername = UserDefaults.standard.string(forKey: "currentUser")
        ref.child("username/" + (currentUsername ?? "")).child("donation"+String(UserDefaults.standard.integer(forKey: "totalTimesDB"))).setValue(["Donation Type":"Pick Up Donation", "Items Donated":UserDefaults.standard.integer(forKey: "donationBoxesDB"), "Name":name_pickUp!,"Phone":phone_pickUp!,"Email":email_pickUp!,"Address 1":address1_pickUp!,"Address 2":address2_pickUp!,"City":city_pickUp!,"Zip Code":zipCode_pickUp!,"Country":country_pickUp!,"Other Info":addtionalInfo_pickUp!])
        
    }
    
    @IBAction func mailDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.synchronize()
        
        let ref = Database.database().reference()
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalBoxes").setValue(totalBoxes)
        
        
        // donation mail info list
        let firstName_mail =         UserDefaults.standard.string(forKey: "firstName_mail")
        let lastName_mail =         UserDefaults.standard.string(forKey: "lastName_mail")
        let email_mail =         UserDefaults.standard.string(forKey: "email_mail")
        let returnAddress_mail =         UserDefaults.standard.string(forKey: "returnAddress_mail")
        let address1_mail =         UserDefaults.standard.string(forKey: "address1_mail")
        let address2_mail =         UserDefaults.standard.string(forKey: "address2_mail")
        let city_mail =         UserDefaults.standard.string(forKey: "city_mail")
        let zipCode_mail =         UserDefaults.standard.string(forKey: "zipCode_mail")
        let country_mail =         UserDefaults.standard.string(forKey: "country_mail")
        let weight_mail =         UserDefaults.standard.string(forKey: "weight_mail")
        
        
        let currentUsername = UserDefaults.standard.string(forKey: "currentUser")
        ref.child("username/" + (currentUsername ?? "")).child("donation"+String(UserDefaults.standard.integer(forKey: "totalTimesDB"))).setValue(["Donation Type":"Mail Donation", "Items Donated":UserDefaults.standard.integer(forKey: "donationBoxesDB"), "First Name":firstName_mail,"Last Name":lastName_mail,"Email":email_mail,"Return Address":returnAddress_mail,"Address 1":address1_mail,"Address 2":address2_mail,"City":city_mail,"Zip Code":zipCode_mail,"Country":country_mail,"Total weight":weight_mail])
        
    }
    
    
    
    override func viewDidLoad() {

        let ref = Database.database().reference()
        ref.child("username/" + UserDefaults.standard.string(forKey: "currentUser")! + "/totalTimes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalTimesFirebase = snapshot.value as? [Int:Any]
            self.userDefaults.set(totalTimesFirebase, forKey:"totalTimesDB")
        }
        ref.child("username/" + UserDefaults.standard.string(forKey: "currentUser")! + "/totalBoxes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalBoxesFirebase = snapshot.value as? [Int:Any]
            self.userDefaults.set(totalBoxesFirebase, forKey:"totalBoxesDB")
        }

        
        super.viewDidLoad()
        
    }
}
