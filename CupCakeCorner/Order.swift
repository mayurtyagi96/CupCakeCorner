//
//  Order.swift
//  CupCakeCorner
//
//  Created by Mayur  on 07/08/24.
//

import Foundation

@Observable
class Order{
    static var types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quanity = 1
    var specialRequestEnabled = false{
        didSet{
            if specialRequestEnabled == false{
                extraFrostings = false
                addSprinkles = false
            }
        }
    }
    var extraFrostings = false
    var addSprinkles = false
}
