//
//  ExpandableDonationItems.swift
//  Caties-Closet-iOS
//
//  Created on 4/7/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//


import Foundation

protocol Content {
    
}

class Label: Content {
    // Header stuff
}

class minusButton: Content {
    // Item stuff
}

class quantity: Content {
    // Item stuff
}

class plusButton: Content {
    // Item stuff
}

var content = [AnyObject]()
struct ExpandableDonationItems {
    
    var isExpanded: Bool
    let items: [String]
    var content: [[AnyObject]]
    //var firstPlus: Bool!
    //var quantity: Int!
    //var firstMinus: Bool!
    
}
