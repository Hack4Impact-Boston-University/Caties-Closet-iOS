//
//  ViewController.swift
//  Caties-Closet-iOS
//
//  Created by Michael Hendrick on 2/25/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

extension UIViewController {
    func HideKeyboard() {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    
    @objc func DismissKeyboard () {
        view.endEditing(true)
    }
}


class ViewControllerLogin: UIViewController {


    
    // Display error messages.
    func displayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title:"Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        // Might be a good idea to attach handler
        let defaultAction:UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    
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
    
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmationField: UITextField!
    
    var fullname = ""
    var username = ""
    var email = ""
    var password = ""
    var passwordConfirmation = ""
    
    
    // Store the new user information (we need more validations)
    @IBAction func signupPressed(_ sender: Any) {
        self.fullname = fullNameField.text!
        self.username = userNameField.text!
        self.email = emailField.text!
        self.password = passwordField.text!
        self.passwordConfirmation = passwordConfirmationField.text!
        
        // If incomplete fields exist
        if(fullname == "" || username == "" || email == "" || password == "" || passwordConfirmation == "") {
            displayAlert(message: "Please fill out all the information.")
            return
        }
        
        // If Password and PasswordConfirmation do not match
        if(password != passwordConfirmation) {
            displayAlert(message: "Passwords do not match.")
            return
        }
        
        
        
        
        // check for duplicated usernames
        // unwrap Optional<Array<String>> -> Array<String>
        let tempAllUsers: [String]!
        tempAllUsers = UserDefaults.standard.value(forKey: "allUsers") as? [String]
        
        //list of all usernames stored in allUsers
        var allUsers: [String] = tempAllUsers
        
        var inUsernameList = false
        for x in allUsers {
            if (username == x){
                displayAlert(message: "This username has been used, please select another username.")
                inUsernameList = true
            }
        }
        if inUsernameList == false {
            allUsers.append(username)
        }
        userDefaults.set(allUsers, forKey:"allUsers")
        
        // Store data with keys
        userDefaults.set(fullname, forKey:"name")
        userDefaults.set(username, forKey:"username")
        userDefaults.set(password, forKey:"password")
        userDefaults.set(email, forKey:"email")

        userDefaults.synchronize()
        
        performSegue(withIdentifier: "ConfirmSignUp", sender: self)
    }
    
    
    /* Login */
    
    @IBOutlet weak var usernameEntered: UITextField!
    @IBOutlet weak var passwordEntered: UITextField!
    
    @IBAction func loginPressed(_ sender: Any) {
        let username = usernameEntered.text;
        let password = passwordEntered.text;
        var usernameDB: String
        
        
        //unwrap Optional<Array<String>> -> Array<String>
        let tempAllUsers: [String]!
        tempAllUsers = UserDefaults.standard.value(forKey: "allUsers") as? [String]

        //list of all usernames stored in allUsers
        let allUsers: [String] = tempAllUsers
        
        if (username == "" || password == "") {
            displayAlert(message: "Please enter both your username and password.")
        }
        else {
            for x in allUsers {
                
                if (username == x) {
                    usernameDB = username ?? ""
                    userDefaults.set(username, forKey: "currentUser")
                    userDefaults.synchronize()
                    
                    //check corresponding password
                    let ref = Database.database().reference()
                    ref.child("username/" + usernameDB + "/password").observeSingleEvent(of: .value, with: { (snapshot) in
                        let currentPassword = snapshot.value as! String
                        print("hi" ,currentPassword)
                        if (password == currentPassword) {
                            self.userDefaults.set(currentPassword, forKey:"currentPassword")
                        }
                        else {
                            self.displayAlert(message: "Incorrect password.")
                        }
                        
                    })
                    performSegue(withIdentifier: "ConfirmLogIn", sender: self)
                    break
                }
            }
            displayAlert(message: "Incorrect username.")
        }



    }
    
    
    
    @IBOutlet weak var newFullNameField: UITextField!
    @IBOutlet weak var newUserNameField: UITextField!
    @IBOutlet weak var newEmailField: UITextField!
    @IBOutlet weak var previousPasswordField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    
    @IBAction func EditAccount(_ sender: Any) {
        let newfullname = newFullNameField.text
        let newusername = newUserNameField.text
        let newemail = newEmailField.text
        let previouspassword = previousPasswordField.text
        let newpassword = newPasswordField.text
        
        // If incomplete fields exist
        if(newfullname == "" || newusername == "" || newemail == "" || previouspassword == "" || newpassword == "") {
            displayAlert(message: "Please fill out all the information.")
            return
        }
        
        // If Password and PasswordConfirmation do not match
        if(previouspassword != UserDefaults.standard.string(forKey: "password")) {
            displayAlert(message: "Previous password incorrect.")
            return
        }
        
        // Store data with keys
        userDefaults.set(newfullname, forKey:"name")
        userDefaults.set(newusername, forKey:"username")
        userDefaults.set(newemail, forKey:"email")
        userDefaults.set(newpassword, forKey:"password")
        userDefaults.synchronize()
        

        performSegue(withIdentifier: "ConfirmEditProfile", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        
        
        // check if username is in database
        let ref = Database.database().reference()
        
        var userList = [String]()
        ref.child("username").observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let userDict = snap.value as! [String: Any]
                
                //unwrap Optional<String> -> String
                //need if-else
                if (userDict.values.compactMap{$0 as? String}[0] != "") {
                    let users = userDict.values.compactMap{$0 as? String}[0]
                    userList.append(users) //find all usernames in firebase and append into userList
                }
                else {
                    let users = userDict.values.compactMap{$0 as? String}[1]
                    userList.append(users)
                }
                
                self.userDefaults.set(userList, forKey:"allUsers")
                self.userDefaults.synchronize()
            }
        })
        
    }
    

}

