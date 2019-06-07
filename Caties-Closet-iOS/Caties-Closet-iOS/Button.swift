//
//  Button.swift
//  trialDonationForm
//
//  Created by ASF on 4/8/19.
//  Copyright © 2019 ASF. All rights reserved.
//
//  Modified by Hack4ImpactBostonUniversity on 3/29/2019
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit

class Button: UIViewController {
    
    
    
    
    @IBOutlet weak var number: buttonClass!
    @IBOutlet weak var number2: buttonClass!
    @IBOutlet weak var number3: buttonClass!
    @IBOutlet weak var number4: buttonClass!
    @IBOutlet weak var number5: buttonClass!
    @IBOutlet weak var number6: buttonClass!
    @IBOutlet weak var number7: buttonClass!
    @IBOutlet weak var number8: buttonClass!
    @IBOutlet weak var number9: buttonClass!
    @IBOutlet weak var number10: buttonClass!
    @IBOutlet weak var number11: buttonClass!
    @IBOutlet weak var number12: buttonClass!
    @IBOutlet weak var number13: buttonClass!
    @IBOutlet weak var number14: buttonClass!
    @IBOutlet weak var number15: buttonClass!
    @IBOutlet weak var number16: buttonClass!
    @IBOutlet weak var number17: buttonClass!
    @IBOutlet weak var number18: buttonClass!
    @IBOutlet weak var number19: buttonClass!
    @IBOutlet weak var number20: buttonClass!
    @IBOutlet weak var number21: buttonClass!
    @IBOutlet weak var number22: buttonClass!
    @IBOutlet weak var number23: buttonClass!
    @IBOutlet weak var number24: buttonClass!

    
    let userDefaults = UserDefaults.standard
    var count = 0
    
    @IBAction func addOne(_ sender: Any) {
        number.add()
        self.count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
        var data = UserDefaults.standard.integer(forKey: "donationBoxesDB")
        print("in database" + String(data))
    }
    @IBAction func addOne2(_ sender: Any) {
        number2.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne3(_ sender: Any) {
        number3.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne4(_ sender: Any) {
        number4.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne5(_ sender: Any) {
        number5.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne6(_ sender: Any) {
        number6.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne7(_ sender: Any) {
        number7.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne8(_ sender: Any) {
        number8.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne9(_ sender: Any) {
        number9.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne10(_ sender: Any) {
        number10.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne11(_ sender: Any) {
        number11.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne12(_ sender: Any) {
        number12.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne13(_ sender: Any) {
        number13.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne14(_ sender: Any) {
        number14.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne15(_ sender: Any) {
        number15.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne16(_ sender: Any) {
        number16.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne17(_ sender: Any) {
        number17.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne18(_ sender: Any) {
        number18.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne19(_ sender: Any) {
        number19.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne20(_ sender: Any) {
        number20.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne21(_ sender: Any) {
        number21.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne22(_ sender: Any) {
        number22.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne23(_ sender: Any) {
        number23.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne24(_ sender: Any) {
        number24.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    
    @IBAction func subtractOne(_ sender: Any) {
        number.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func subtractOne2(_ sender: Any) {
        number2.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne3(_ sender: Any) {
        number3.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne4(_ sender: Any) {
        number4.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne5(_ sender: Any) {
        number5.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne6(_ sender: Any) {
        number6.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne7(_ sender: Any) {
        number7.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne8(_ sender: Any) {
        number8.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne9(_ sender: Any) {
        number9.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne10(_ sender: Any) {
        number10.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne11(_ sender: Any) {
        number11.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne12(_ sender: Any) {
        number12.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne13(_ sender: Any) {
        number13.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne14(_ sender: Any) {
        number14.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne15(_ sender: Any) {
        number15.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne16(_ sender: Any) {
        number16.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne17(_ sender: Any) {
        number17.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne18(_ sender: Any) {
        number18.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne19(_ sender: Any) {
        number19.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne20(_ sender: Any) {
        number20.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne21(_ sender: Any) {
        number21.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne22(_ sender: Any) {
        number22.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne23(_ sender: Any) {
        number23.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne24(_ sender: Any) {
        number24.subtract()
        count -= 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
