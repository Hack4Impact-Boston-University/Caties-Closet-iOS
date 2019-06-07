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
    
    var totalTimes = 0
    var totalBoxes = 0
    var totalMoney = 0.00
    
    let userDefaults = UserDefaults.standard

    
    @IBAction func pickUpDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        // Store data with keys
        print(totalBoxes)
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.synchronize()
        
        
        performSegue(withIdentifier: "DonationCompute", sender: self)
        
    }
    
    @IBAction func mailDonation(_ sender: Any) {
        totalTimes += 1
        totalBoxes += UserDefaults.standard.integer(forKey: "donationBoxesDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalBoxes, forKey:"totalBoxesDB")
        userDefaults.synchronize()
        
        performSegue(withIdentifier: "DonationCompute", sender: self)
        
    }
    
    @IBAction func moneyDonation(_ sender: Any) {
        totalTimes += 1
        totalMoney += UserDefaults.standard.double(forKey: "donationMoneyDB")
        
        userDefaults.set(totalTimes, forKey:"totalTimesDB")
        userDefaults.set(totalMoney, forKey:"totalMoneyDB")
        userDefaults.synchronize()
        
        performSegue(withIdentifier: "DonationCompute", sender: self)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
}
