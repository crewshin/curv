//: Playground - noun: a place where people can play

import UIKit


let baseAmount = 50000.0
let percentReturn = 200.0
let years = 10

// Calc decimal of percent.
var out: Double = 0.0
var previous: Double = 0.0
let returnPercent = percentReturn * 0.01

// Create tmp array to store values.
var tmpArray = [Double]()

// Loop through years.
for var index = 0; index < years; ++index
{
    if index == 0
    {
        out = baseAmount
        tmpArray.append(baseAmount)
    }
    else if index == 1
    {
        println(out)
        println(previous)
        
        out = (out * returnPercent)
        tmpArray.append(out)
        previous = baseAmount
    }
    else
    {
        println(tmpArray.last!)
        println(previous)

        let tmp = (tmpArray.last! * returnPercent) + previous
        previous = tmpArray.last!
        tmpArray.append(tmp)
    }
}

println(tmpArray)




