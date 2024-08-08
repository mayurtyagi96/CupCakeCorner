//
//  Order.swift
//  CupCakeCorner
//
//  Created by Mayur  on 07/08/24.
//

import Foundation

@Observable
class Order: Codable{
    enum CodingKeys: String, CodingKey{
        case _type = "type"
        case _quanity = "quanity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrostings = "extraFrostings"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zipCode = "zipCode"
    }
    
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
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zipCode = ""
    
    var hasValidAddress: Bool{
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zipCode.isEmpty{
            return false
        }
        return true
    }
    
    var cost: Decimal{
        //  base price
        var cost = Decimal(quanity) * 2
        // complicted cakes
        cost += Decimal(type) / 2
        
        //additional charges
        if extraFrostings{
            cost += Decimal(quanity)
        }
        if addSprinkles{
            cost += Decimal(quanity) / 2
        }
        
        return cost
    }
    
}
