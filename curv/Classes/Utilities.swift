//
//  Utilities.swift
//  curv
//
//  Created by Gene Crucean on 6/26/15.
//  Copyright (c) 2015 Dagger Dev. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    class func convertToCurrencyFormat(value: Double) -> String
    {
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        return numberFormatter.stringFromNumber(value)!
    }
    
}
