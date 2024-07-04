//
//  Order.swift
//  CupcakeCorner
//
//  Created by Glen Chen on 4/7/24.
//

import SwiftUI


@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
//            so when u turn it off, the default extra things are also false, else they may stay true
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    
    var cost: Decimal {
//        base price 2 dollar
        var cost = Decimal(quantity) * 2
        
//        extra frost add $1, more sprinkle add 50 cent. for each cake
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
}
