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
        case _address = "address"
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
    
    var address: Address{
        didSet{
            let data = try? JSONEncoder().encode(address)
            UserDefaults.standard.set(data, forKey: "address")
        }
    }

    var hasValidAddress: Bool{
        if address.name.trimed().isEmpty || address.streetAddress.trimed().isEmpty || address.city.trimed().isEmpty || address.zipCode.trimed().isEmpty{
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
    init(){
        if let data = UserDefaults.standard.data(forKey: "address"){
            if let addrsss = try? JSONDecoder().decode(Address.self, from: data){
                self.address = addrsss
                return
            }
        }
        self.address = Address()
    }
}

struct Address: Codable{
    var name = ""
    var streetAddress = ""
    var city = ""
    var zipCode = ""
}
