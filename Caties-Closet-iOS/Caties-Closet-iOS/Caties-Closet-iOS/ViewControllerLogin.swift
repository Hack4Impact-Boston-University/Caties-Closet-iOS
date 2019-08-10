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
import FirebaseAuth


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
        else if (password.count < 6 ){
            displayAlert(message: "Password must be at least 6 characters long")
            return
        }
        else if (email.contains("@") == false){
            displayAlert(message: "Please enter a valid email.")
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
        userDefaults.set(username, forKey:"currentUser")
        userDefaults.set(email, forKey:"email")
        userDefaults.set(password, forKey:"password")

        userDefaults.synchronize()
        
        

        
        performSegue(withIdentifier: "ConfirmSignUp", sender: self)
    }
    
    
    /* Login */
    
    @IBOutlet weak var usernameEntered: UITextField!
    @IBOutlet weak var passwordEntered: UITextField!
    @IBOutlet weak var emailEntered: UITextField!
    
    @IBAction func loginPressed(_ sender: Any) {
        let username = usernameEntered.text;
        let email = emailEntered.text!;
        let password = passwordEntered.text!;
        var usernameDB: String
        var correctUsername = false;
        
        //unwrap Optional<Array<String>> -> Array<String>
        let tempAllUsers: [String]!
        tempAllUsers = UserDefaults.standard.value(forKey: "allUsers") as? [String]
        
        //list of all usernames stored in allUsers
        let allUsers: [String] = tempAllUsers
        
        if (username == "" || email == "" || password == "") {
            displayAlert(message: "Please enter your username, email, and password.")
        } else {
            for x in allUsers {
                print(x)
                print(username==x)
                if (username == x) {
                    correctUsername = true
                    usernameDB = username ?? ""
                    userDefaults.set(username, forKey: "currentUser")
                    userDefaults.synchronize()
                    
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if( error != nil){
                            self.displayAlert(message: "Incorrect email or password")
                        } else {
                            let firebaseID = Auth.auth().currentUser?.email
                            self.performSegue(withIdentifier: "ConfirmLogIn", sender: self)
                        }
                    }
                    break
                }
            }

        }
        if (correctUsername == false){
            self.displayAlert(message: "Incorrect username")
        }

    }
    
    
    
    @IBOutlet weak var newFullNameField: UITextField!
    @IBOutlet weak var newUserNameField: UITextField!
    @IBOutlet weak var newEmailField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var confirmNewPasswordField: UITextField!
    
    @IBAction func EditAccount(_ sender: Any) {
        let newfullname = newFullNameField.text
        let newemail = newEmailField.text
        let newPassword = newPasswordField.text
        let confirmNewpassword = confirmNewPasswordField.text
        
        // If incomplete fields exist
        if(newfullname == "" || newemail == "" || confirmNewpassword == "" || confirmNewpassword == "") {
            displayAlert(message: "Please fill out all the information.")
            return
        }
        
        // If Password and PasswordConfirmation do not match
        if(newPassword != confirmNewpassword) {
            displayAlert(message: "Please confirm your new password.")
            return
        }
        else if (newPassword!.count < 6 ){
            displayAlert(message: "Password must be at least 6 characters long")
            return
        }
        
        
        
        // Store data with keys
        userDefaults.set(newfullname, forKey:"newname")
        userDefaults.set(newemail, forKey:"newemail")
        userDefaults.set(newPassword, forKey:"newpassword")

        userDefaults.synchronize()
        

        print("old email", UserDefaults.standard.string(forKey: "email"))

        performSegue(withIdentifier: "ConfirmEditProfile", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        
        
        // check if username is in database
        let ref = Database.database().reference()
        
        var userList = [String]()
        ref.child("username").observeSingleEvent(of: .value, with: { snapshot in
            
            let userDict = snapshot.value as! [String: Any]

            for x in userDict.keys{
                userList.append(x)
                print(userList)
            }
            
            self.userDefaults.set(userList, forKey:"allUsers")
            self.userDefaults.synchronize()
        })
        
    }
    

}

