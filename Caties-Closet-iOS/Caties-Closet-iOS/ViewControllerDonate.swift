//
//  ViewControllerDonate.swift
//  Caties-Closet-iOS
//
//  Created by Архип on 4/16/17.
//  Copyright © 2017 ArkhypKoshel. All rights reserved.
//
//  Modified by Hack4ImpactBostonUniversity on 3/29/2019
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit

class ViewControllerDonate: UIViewController, AKRadioButtonsControllerDelegate {
    var radioButtonsController: AKRadioButtonsController!
    var radioButtonsController2: BKRadioButtonsController!
    
    @IBOutlet var radioButtons: [AKRadioButton]!
    @IBOutlet var radioButtons2: [BKRadioButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.radioButtonsController = AKRadioButtonsController(radioButtons: self.radioButtons)
        self.radioButtonsController.delegate = self
        
        self.radioButtonsController2 = BKRadioButtonsController(radioButtons: self.radioButtons2)
        
    }
    
    func selectedButton(sender: AKRadioButton){
        
    }
    
    func selectedButton(sender: BKRadioButton){
        
    }
    
}
