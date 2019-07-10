//
//  DonationFormInfo.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 6/1/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit


class DonationFormInfo: UIViewController {
    
    @IBOutlet weak var firstName_mail: UITextField!
    @IBOutlet weak var lastName_mail: UITextField!
    @IBOutlet weak var email_mail: UITextField!
    @IBOutlet weak var returnAddress_mail: UITextView!
    @IBOutlet weak var address1_mail: UITextField!
    @IBOutlet weak var address2_mail: UITextField!
    @IBOutlet weak var city_mail: UITextField!
    @IBOutlet weak var zipCode_mail: UITextField!
    @IBOutlet weak var country_mail: UITextField!
    @IBOutlet weak var weight_mail: UITextField!
    
    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    
    @IBAction func mail(_ sender: Any) {
        if (firstName_mail.text == "" || lastName_mail.text == "" || email_mail.text == "" || returnAddress_mail.text == "" || address1_mail.text == "" || city_mail.text == "" || zipCode_mail.text == "" || country_mail.text == "" || weight_mail.text == "") {
            displayAlert(message: "Please fill out the required information.")
        }
        performSegue(withIdentifier: "confirm_mail", sender: self)
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
    }
}
