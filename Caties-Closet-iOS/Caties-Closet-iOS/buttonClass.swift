//
//  buttonClass.swift
//  trialDonationForm
//
//  Created by ASF on 4/8/19.
//  Copyright © 2019 ASF. All rights reserved.
//
//  Modified by Hack4ImpactBostonUniversity on 3/29/2019
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import Foundation
import UIKit

class buttonClass: UILabel{
    
    var count = 0;
    
    func add(){
        count += 1
        super.text = String(count)
    }
    
    func subtract(){
        count -= 1;
        super.text = String(count)
    }
    
    
}



