//
//  UserNamePasswordConfirmationClass.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 6/6/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit

class UserNamePasswordConfirmationClass: UILabel{
    
    func confirm() {
        
    }
    func print_fullname(){
        super.text = String(fullname)
    }
    
    func print_username(){
        super.text = String(username)
    }
    
    func print_email(){
        super.text = String(email)
    }
    
    func print_password(){
        super.text = String(password)
    }
    
}

