//
//  ComputeDonation.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 6/6/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit

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
        userDefaults.synchronize()
        
        
        //performSegue(withIdentifier: "DonationCompute", sender: self)
        
    }
    
    @IBAction func mailDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.synchronize()
        
        //performSegue(withIdentifier: "DonationCompute1", sender: self)
        
    }
    
    @IBAction func moneyDonation(_ sender: Any) {
        totalTimes += 1
        totalMoney += UserDefaults.standard.double(forKey: "donationMoneyDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalMoney, forKey:"totalMoneyDB")
        userDefaults.synchronize()
        
        //performSegue(withIdentifier: "DonationCompute2", sender: self)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
}
