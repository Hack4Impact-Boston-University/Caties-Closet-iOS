//
//  VolunteerSignUp.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 8/9/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth


class VolunteerSignUp: UIViewController {

    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var location: UITextField!
    
    var firstname = ""
    var middlename = ""
    var lastname = ""
    var emailstr = ""
    var genderstr = ""
    var locationstr = ""
    
    @IBAction func signUp(_ sender: Any) {
        self.firstname = firstName.text!
        self.middlename = middleName.text!
        self.lastname = lastName.text!
        self.emailstr = email.text!
        self.genderstr = gender.text!
        self.locationstr = location.text!
        
        if (firstname == "" || lastname == "" || emailstr == "" || genderstr == "" ) {
            self.displayAlert(message: "Please fill out all the information.")

            print("hi")
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(firstName.text, forKey:"volunteerFirstName")
        userDefaults.set(middleName.text, forKey:"volunteerMiddleName")
        userDefaults.set(lastName.text, forKey:"volunteerLastName")
        userDefaults.set(email.text, forKey:"volunteerEmail")
        userDefaults.set(gender.text, forKey:"volunteerGender")
        userDefaults.set(location.text, forKey:"volunteerLocation")
        userDefaults.synchronize()
        
        performSegue(withIdentifier: "volunteerSignUp", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
    }
}
