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
import FirebaseAuth

class ComputeDonation : UIViewController {
    
    let firebaseID = Auth.auth().currentUser!.uid
    
    var totalTimes = UserDefaults.standard.integer(forKey: "totalTimesDB")
    var totalBoxes = UserDefaults.standard.integer(forKey: "totalBoxesDB")
    var totalMoney = UserDefaults.standard.double(forKey: "totalMoneyDB")

    
    let userDefaults = UserDefaults.standard

    
    @IBAction func pickUpDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.set(totalMoney, forKey:"totalMoneyDB")
        userDefaults.synchronize()

        let ref = Database.database().reference()
        ref.child("username/" + (firebaseID) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (firebaseID) + "/totalBoxes").setValue(totalBoxes)
        
    }
    
    @IBAction func mailDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.set(totalMoney, forKey:"totalMoneyDB")
        userDefaults.synchronize()
        
        let ref = Database.database().reference()
        ref.child("username/" + (firebaseID) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (firebaseID) + "/totalBoxes").setValue(totalBoxes)
        
    }
    
    @IBAction func moneyDonation(_ sender: Any) {
        totalTimes += 1
        totalMoney += UserDefaults.standard.double(forKey: "donationMoneyDB")

        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.set(totalMoney, forKey:"totalMoneyDB")
        userDefaults.synchronize()
        
        let ref = Database.database().reference()
        ref.child("username/" + (firebaseID) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (firebaseID) + "/totalMoney").setValue(totalMoney)

    }
    
    
    override func viewDidLoad() {

        let ref = Database.database().reference()
        ref.child("username/" + firebaseID + "/totalTimes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalTimesFirebase = snapshot.value as? [Int:Any]
            self.userDefaults.set(totalTimesFirebase, forKey:"totalTimesDB")
        }
        ref.child("username/" + firebaseID + "/totalBoxes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalBoxesFirebase = snapshot.value as? [Int:Any]
            self.userDefaults.set(totalBoxesFirebase, forKey:"totalBoxesDB")
        }
        ref.child("username/" + firebaseID + "/totalMoney").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalMoneyFirebase = snapshot.value as? [Double:Any]
            self.userDefaults.set(totalMoneyFirebase, forKey:"totalMoneyDB")
        }
        
        super.viewDidLoad()
        
    }
}
