//
//  DonationFormInfoPickUp.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 6/1/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit


class DonationFormInfoPickUp: UIViewController {
    
    @IBOutlet weak var name_pickUp: UITextField!
    @IBOutlet weak var phone_pickUp: UITextField!
    @IBOutlet weak var email_pickUp: UITextField!
    @IBOutlet weak var address1_pickUp: UITextField!
    @IBOutlet weak var address2_pickUp: UITextField!
    @IBOutlet weak var city_pickUp: UITextField!
    @IBOutlet weak var zipCode_pickUp: UITextField!
    @IBOutlet weak var country_pickUp: UITextField!
    @IBOutlet weak var addtionalInfo_pickUp: UITextField!
    
    
    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    @IBAction func pickUp(_ sender: Any) {
        if (name_pickUp.text == "" || phone_pickUp.text == "" || email_pickUp.text == "" || address1_pickUp.text == "" || city_pickUp.text == "" || zipCode_pickUp.text == "" || country_pickUp.text == "") {
            displayAlert(message: "Please fill out the required information.")
        }
        
        UserDefaults.standard.set(name_pickUp.text!, forKey:"name_pickUp")
        UserDefaults.standard.set(phone_pickUp.text!, forKey:"phone_pickUp")
        UserDefaults.standard.set(email_pickUp.text!, forKey:"email_pickUp")
        UserDefaults.standard.set(address1_pickUp.text!, forKey:"address1_pickUp")
        UserDefaults.standard.set(address2_pickUp.text!, forKey:"address2_pickUp")
        UserDefaults.standard.set(city_pickUp.text!, forKey:"city_pickUp")
        UserDefaults.standard.set(zipCode_pickUp.text!, forKey:"zipCode_pickUp")
        UserDefaults.standard.set(country_pickUp.text!, forKey:"country_pickUp")
        UserDefaults.standard.set(addtionalInfo_pickUp.text!, forKey:"addtionalInfo_pickUp")

        
        performSegue(withIdentifier: "confirm_pickUp", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        
    }
    
}
