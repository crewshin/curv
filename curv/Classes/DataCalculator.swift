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
        
        
        
//        let baseAmount = 50000.0
//        let returnPercent = 2.0
//        let years = 10
        
        let returnPercent = percentReturn * 0.01
        
        // you know the size of the array so you don't have to append to it and just use the subscript which is much faster
        var array = [Double](count: years, repeatedValue: 0)
        var previousValue = 0.0
        var currentValue = baseAmount
        
        for i in 0..<years {
            array[i] = currentValue
            let p2 = currentValue
            currentValue = currentValue * returnPercent + previousValue
            previousValue = p2
        }
        
        print(array)
        
        return array
    }
    
}
