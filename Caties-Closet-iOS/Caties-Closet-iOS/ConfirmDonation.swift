//
//  ConfirmDonation.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 6/6/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit


class ConfirmDonation: UIViewController {
    
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var boxes: UITextField!
    @IBOutlet weak var money: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let totalTimesDB = UserDefaults.standard.integer(forKey: "totalTimesDB")
        let totalBoxesDB = UserDefaults.standard.integer(forKey: "totalBoxesDB")
        let totalMoneyDB = UserDefaults.standard.double(forKey: "totalMoneyDB")
        
        
        total.text = String(totalTimesDB)
        boxes.text = String(totalBoxesDB)
        money.text = String(totalMoneyDB)

        
    }
}
