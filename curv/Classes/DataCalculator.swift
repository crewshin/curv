//
//  DataCalculator.swift
//  curv
//
//  Created by Gene Crucean on 6/24/15.
//  Copyright (c) 2015 Dagger Dev. All rights reserved.
//

import UIKit
import Charts

class DataCalculator: NSObject {
   
    class func calculateCurve(baseAmount: Double, percentReturn: Double, years: Int) -> [Double]
    {
        let percentReturnAsDecimal = percentReturn * 0.01
        
        // We know the size of the array, no need to append
        var result = [Double](count: years, repeatedValue: 0.0)
        result[0] = baseAmount
        
        // No need to do this in the loop
        if years > 1 {
            result[1] = baseAmount * percentReturnAsDecimal + result[0]
        }
        
        // Loop through years 2+
        for year in 2 ..< years {
            let lastYear = result[year - 1]
            result[year] = (lastYear * percentReturnAsDecimal) + lastYear
        }
 
        return result
    }
    
}
