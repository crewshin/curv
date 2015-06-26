//: Playground - noun: a place where people can play

import UIKit


//let baseAmount = 50000.0
//let percentReturn = 200.0
//let years = 10
//
//// Calc decimal of percent.
//var out: Double = 0.0
//var previous: Double = 0.0
//let returnPercent = percentReturn * 0.01
//
//// Create tmp array to store values.
//var tmpArray = [Double]()
//
//// Loop through years.
//for var index = 0; index < years; ++index
//{
//    if index == 0
//    {
//        out = baseAmount
//        tmpArray.append(baseAmount)
//    }
//    else if index == 1
//    {
//        println(out)
//        println(previous)
//        
//        out = (out * returnPercent)
//        tmpArray.append(out)
//        previous = baseAmount
//    }
//    else
//    {
//        println(tmpArray.last!)
//        println(previous)
//
//        let tmp = (tmpArray.last! * returnPercent) + previous
//        previous = tmpArray.last!
//        tmpArray.append(tmp)
//    }
//}
//
//println(tmpArray)








let baseAmount = 50000.0
let percentReturn = 50.0
let years = 10

// 3.
if years < 1 {
//    return [Double]()
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