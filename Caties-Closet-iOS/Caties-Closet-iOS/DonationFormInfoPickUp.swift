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
        performSegue(withIdentifier: "confirm_pickUp", sender: self)
        return
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        
    }
    
}
