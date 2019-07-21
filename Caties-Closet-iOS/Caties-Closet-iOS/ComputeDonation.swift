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
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalBoxes").setValue(totalBoxes)
        
    }
    
    @IBAction func mailDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.set(totalMoney, forKey:"totalMoneyDB")
        userDefaults.synchronize()
        
        let ref = Database.database().reference()
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalBoxes").setValue(totalBoxes)
        
    }
    
    @IBAction func moneyDonation(_ sender: Any) {
        totalTimes += 1
        totalMoney += UserDefaults.standard.double(forKey: "donationMoneyDB")

        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.set(totalMoney, forKey:"totalMoneyDB")
        userDefaults.synchronize()
        
        let ref = Database.database().reference()
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalTimes").setValue(totalTimes)
        ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalMoney").setValue(totalMoney)

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
        ref.child("username/" + UserDefaults.standard.string(forKey: "currentUser")! + "/totalMoney").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalMoneyFirebase = snapshot.value as? [Double:Any]
            self.userDefaults.set(totalMoneyFirebase, forKey:"totalMoneyDB")
        }
        
        super.viewDidLoad()
        
    }
}
