//
//  ViewController.swift
//  Caties-Closet-iOS
//
//  Created by Michael Hendrick on 2/25/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit

class ViewControllerLogin: UIViewController {
    
    @IBAction func goBack(_ segue:UIStoryboardSegue) {}
    
    @IBAction func goToSignUpPage(_ sender:UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "SignUpPage")
        self.present(next,animated: true, completion: nil)
    }
    
    @IBAction func goToLoginPage(_ sender:UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "LoginPage")
        self.present(next,animated: true, completion: nil)
    }

    let userDefaults = UserDefaults.standard
    
    /* Signup */
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmationField: UITextField!
    
    // Store the new user information (we need more validations)
    @IBAction func signupPressed(_ sender: Any) {
        let username = userNameField.text
        let password = passwordField.text
        let passwordConfirmation = passwordConfirmationField.text
        
        // If incomplete fields exist
        if(username == "" || password == "" || passwordConfirmation == "") {
            displayAlert(message: "Fill out all the information.")
            return
        }
        
        // If Password and PasswordConfirmation do not match
        if(password != passwordConfirmation) {
            displayAlert(message: "Passwords do not match.")
            return
        }
        
        // Store data with keys
        userDefaults.set(username, forKey:"username")
        userDefaults.set(password, forKey:"password")
        userDefaults.synchronize()
        displayAlert(message: "Signed up successfully.")
        
        let str: String = userDefaults.object(forKey: "username") as! String
        let str_2: String = userDefaults.object(forKey: "password") as! String
        print(str)
        print(str_2)
    }
    
    /* Login */
    
    @IBOutlet weak var usernameEntered: UITextField!
    @IBOutlet weak var passwordEntered: UITextField!
    
    @IBAction func loginPressed(_ sender: Any) {
        let username = usernameEntered.text;
        let password = passwordEntered.text;
        let usernameDB = UserDefaults.standard.string(forKey: "username")
        let passwordDB = UserDefaults.standard.string(forKey: "password")
        if(username == usernameDB && password == passwordDB) {
            print("Logged in successfully.")
        } else {
            print("Incorrect username or password. Please try again.")
        }
    }
    
    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

