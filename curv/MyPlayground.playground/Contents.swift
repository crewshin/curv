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
let percentReturn = 100.0
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
    //            let lastYear = result[year - 1]
    //            let yearBeforeLast = result[year - 2]
//    result[1] = baseAmount * percentReturnAsDecimal
    result[1] = baseAmount * percentReturnAsDecimal + result[0]
}

// Loop through years 2+
for year in 2 ..< years {
    let lastYear = result[year - 1]
    let yearBeforeLast = result[year - 2]
//    result[year] = (lastYear * percentReturnAsDecimal) + yearBeforeLast
    result[year] = (lastYear * percentReturnAsDecimal) + lastYear
}



//$50,000.00
//$100,000.00
//$250,000.00
//$600,000.00
//$1,450,000.00
//$3,500,000.00
//$8,450,000.00
//$20,400,000.00
//$49,250,000.00









