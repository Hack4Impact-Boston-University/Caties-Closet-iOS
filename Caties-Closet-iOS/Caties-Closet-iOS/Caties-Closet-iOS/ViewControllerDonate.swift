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
        
        userDefaults.set(count, forKey:"donationMoneyDB")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonation50(_ sender: Any) {
        count = 50.00
        TotalPrice.text = "$" + String(count)
        
        userDefaults.set(count, forKey:"donationMoneyDB")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonation100(_ sender: Any) {
        count = 100.00
        TotalPrice.text = "$" + String(count)
        
        userDefaults.set(count, forKey:"donationMoneyDB")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonation250(_ sender: Any) {
        count = 250.00
        TotalPrice.text = "$" + String(count)
        
        userDefaults.set(count, forKey:"donationMoneyDB")
        userDefaults.synchronize()
    }
    
    @IBAction func MonetaryDonationOther(_ sender: Any) {
        if let count = Double(otherprice.text!) {
            TotalPrice.text = "$" + String(count)
            
            userDefaults.set(count, forKey:"donationMoneyDB")
            userDefaults.synchronize()
        }
        else {
            print("Not a valid number: \(otherprice.text!)")
        }
    }
    
    @IBOutlet weak var firstName_money: UITextField!
    @IBOutlet weak var middleName_money: UITextField!
    @IBOutlet weak var lastName_money: UITextField!
    @IBOutlet weak var email_money: UITextField!
    @IBOutlet weak var country_money: UITextField!
    @IBOutlet weak var address_money: UITextField!
    @IBOutlet weak var city_money: UITextField!
    @IBOutlet weak var state_money: UITextField!
    @IBOutlet weak var zipCode_money: UITextField!
    @IBOutlet weak var phone_money: UITextField!
    @IBOutlet weak var displayName_money: UITextField!
    @IBOutlet weak var publicComment_money: UITextField!
    @IBOutlet weak var donationDedicationHonor_money: UITextField!
    @IBOutlet weak var donationDedicationMemory_money: UITextField!
    @IBOutlet weak var recognition_money: UITextField!
    @IBOutlet weak var creditCardName_money: UITextField!
    @IBOutlet weak var creditCardNumber_money: UITextField!
    @IBOutlet weak var CVV_money: UITextField!
    @IBOutlet weak var expirationDate_money: UITextField!
    
    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    @IBAction func money(_ sender: Any) {
        if (firstName_money.text == "" || lastName_money.text == "" || email_money.text == "" || country_money.text == "" || address_money.text == "" || city_money.text == "" || state_money.text == "" || zipCode_money.text == "" || phone_money.text == "" || creditCardName_money.text == "" || creditCardNumber_money.text == "" || CVV_money.text == "" || expirationDate_money.text == "") {
            displayAlert(message: "Please fill out the required information.")
            return
        }
    }
    
}
