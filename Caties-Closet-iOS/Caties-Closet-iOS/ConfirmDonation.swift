//
//  ConfirmDonation.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 6/6/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class ConfirmDonation: UIViewController {
    
    
    let userDefaults = UserDefaults.standard

    
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var boxes: UITextField!
    @IBOutlet weak var money: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        let ref = Database.database().reference()

        //ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalTimes").setValue(totalTimesDB)
        //ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalBoxes").setValue(totalBoxesDB)
        //ref.child("username/" + (UserDefaults.standard.string(forKey: "currentUser")!) + "/totalMoney").setValue(totalMoneyDB)

        
        
        
        ref.child("username/" + UserDefaults.standard.string(forKey: "currentUser")! + "/totalTimes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalTimesDB = snapshot.value as! Int
            self.total.text = String(totalTimesDB)
            self.userDefaults.set(totalTimesDB, forKey:"totalTimesDB")
        }
        ref.child("username/" + UserDefaults.standard.string(forKey: "currentUser")! + "/totalBoxes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalBoxesDB = snapshot.value as! Int
            self.boxes.text = String(totalBoxesDB)
            self.userDefaults.set(totalBoxesDB, forKey:"totalBoxesDB")
        }
        ref.child("username/" + UserDefaults.standard.string(forKey: "currentUser")! + "/totalMoney").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalMoneyDB = snapshot.value as! Double
            self.money.text = String(totalMoneyDB)
            self.userDefaults.set(totalMoneyDB, forKey:"totalMoneyDB")
        }
        
        
    }
}
