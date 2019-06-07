//
//  ViewControllerDonate.swift
//  Caties-Closet-iOS
//
//  Created by Архип on 4/16/17.
//  Copyright © 2017 ArkhypKoshel. All rights reserved.
//
//  Modified by Hack4ImpactBostonUniversity on 3/29/2019
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit

class ViewControllerDonate: UIViewController, AKRadioButtonsControllerDelegate {
    var radioButtonsController: AKRadioButtonsController!
    var radioButtonsController2: BKRadioButtonsController!
    
    @IBOutlet var radioButtons: [AKRadioButton]!
    @IBOutlet var radioButtons2: [BKRadioButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.radioButtonsController = AKRadioButtonsController(radioButtons: self.radioButtons)
        self.radioButtonsController.delegate = self
        
        self.radioButtonsController2 = BKRadioButtonsController(radioButtons: self.radioButtons2)
        
        self.HideKeyboard()

    }
    
    func selectedButton(sender: AKRadioButton){
        
    }
    
    func selectedButton(sender: BKRadioButton){
        
    }
    
    var count = 0.00
    @IBOutlet weak var otherprice: UITextField!
    @IBOutlet weak var TotalPrice: UITextView!
    
    let userDefaults = UserDefaults.standard

    @IBAction func MonetaryDonation25(_ sender: Any) {
        count = 25.00
        TotalPrice.text = "$" + String(count)
        
        userDefaults.set(count, forKey:"donationMoney")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonation50(_ sender: Any) {
        count = 50.00
        TotalPrice.text = "$" + String(count)
        
        userDefaults.set(count, forKey:"donationMoney")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonation100(_ sender: Any) {
        count = 100.00
        TotalPrice.text = "$" + String(count)
        
        userDefaults.set(count, forKey:"donationMoney")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonation250(_ sender: Any) {
        count = 250.00
        TotalPrice.text = "$" + String(count)
        
        userDefaults.set(count, forKey:"donationMoney")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonationOther(_ sender: Any) {
        if let count = Double(otherprice.text!) {
            TotalPrice.text = "$" + String(count)
            
            userDefaults.set(count, forKey:"donationMoney")
            userDefaults.synchronize()
        }
        else {
            print("Not a valid number: \(otherprice.text!)")
        }
    }
    
    
}
