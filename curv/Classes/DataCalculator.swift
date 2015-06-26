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
        // Orig.
//        var dataEntries: [ChartDataEntry] = []
//        
//        // Calc decimal of percent.
//        var out: Double = 0.0
//        var previous: Double = 0.0
//        let returnPercent = percentReturn * 0.01
//        
//        // Create tmp array to store values.
//        var tmpArray = [Double]()
//        
//        // Loop through years.
//        for var index = 0; index < years; ++index
//        {
//            if index == 0
//            {
//                out = baseAmount
//                tmpArray.append(baseAmount)
//            }
//            else if index == 1
//            {
//                out = (out * returnPercent)
//                tmpArray.append(out)
//                previous = baseAmount
//            }
//            else
//            {
//                let tmp = (tmpArray.last! * returnPercent) + previous
//                previous = tmpArray.last!
//                tmpArray.append(tmp)
//            }
//        }
        
//        println("tmpArray: \(tmpArray)")
        
        

        // 2.
//        if years < 1 {
//            return [Double]()
//        }
//        
//        let returnPercent = percentReturn * 0.01
//        
//        println("====================================================")
//        println(returnPercent)
//        
//        var array = [Double](count: years, repeatedValue: 0)
//        var previousValue = 0.0
//        var currentValue = baseAmount
//        
//        for i in 0..<years {
//            array[i] = currentValue
//            let p2 = currentValue
//            currentValue = currentValue * returnPercent + previousValue
//            previousValue = p2
//        }
//        
//        println(array)
        
        
        
        // 3.
        if years < 1 {
            return [Double]()
        }
        
        let percentReturnAsDecimal = percentReturn * 0.01
        
        // We know the size of the array, no need to append
        var result = [Double](count: years, repeatedValue: 0.0)
        result[0] = baseAmount
        
        // No need to do this in the loop
        if years > 1 {
            result[1] = baseAmount * percentReturnAsDecimal
        }
        
        // Loop through years 2+
        for year in 2 ..< years {
            let lastYear = result[year - 1]
            let yearBeforeLast = result[year - 2]
            result[year] = (lastYear * percentReturnAsDecimal) + yearBeforeLast
        }
        
        
        
        
        
        
        return result
    }
    
}
