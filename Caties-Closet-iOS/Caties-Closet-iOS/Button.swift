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

    @IBOutlet weak var TotalItems: UITextView!
    
    let userDefaults = UserDefaults.standard
    var count = 0
    
    @IBAction func addOne(_ sender: Any) {
        number.add()
        count += 1
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
        TotalItems.text = String(count) + " items"
        
    }
    @IBAction func addOne2(_ sender: Any) {
        number2.add()
        count += 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne3(_ sender: Any) {
        number3.add()
        count += 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne4(_ sender: Any) {
        number4.add()
        count += 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne5(_ sender: Any) {
        number5.add()
        count += 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne6(_ sender: Any) {
        number6.add()
        count += 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func addOne7(_ sender: Any) {
        number7.add()
        count += 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func addOne8(_ sender: Any) {
        number8.add()
        count += 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    
    @IBAction func subtractOne(_ sender: Any) {
        number.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    
    @IBAction func subtractOne2(_ sender: Any) {
        number2.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne3(_ sender: Any) {
        number3.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne4(_ sender: Any) {
        number4.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne5(_ sender: Any) {
        number5.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne6(_ sender: Any) {
        number6.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne7(_ sender: Any) {
        number7.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    @IBAction func subtractOne8(_ sender: Any) {
        number8.subtract()
        count -= 1
        TotalItems.text = String(count) + " items"
        userDefaults.set(count, forKey:"donationBoxesDB")
        userDefaults.synchronize()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
