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
import FirebaseAuth


class ConfirmDonation: UIViewController {
    
    
    let userDefaults = UserDefaults.standard
    

    
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var boxes: UITextField!
    @IBOutlet weak var money: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        let ref = Database.database().reference()
        let firebaseID = Auth.auth().currentUser?.uid
        
        ref.child("username/" + "yvM5lAmUdAeggdAooUUNjeZIOuq2" + "/totalTimes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalTimesDB = snapshot.value as! String
            self.total.text = String(totalTimesDB)
            self.userDefaults.set(totalTimesDB, forKey:"totalTimesDB")
        }
        ref.child("username/" + firebaseID! + "/totalBoxes").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalBoxesDB = snapshot.value as! Int
            self.boxes.text = String(totalBoxesDB)
            self.userDefaults.set(totalBoxesDB, forKey:"totalBoxesDB")
        }
        ref.child("username/" + firebaseID! + "/totalMoney").observeSingleEvent(of: .value) {
            (snapshot) in
            let totalMoneyDB = snapshot.value as! Double
            self.money.text = String(totalMoneyDB)
            self.userDefaults.set(totalMoneyDB, forKey:"totalMoneyDB")
        }
        
        
    }
}
