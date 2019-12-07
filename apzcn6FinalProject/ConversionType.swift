//
//  ConversionType.swift
//  ConversionCalculator
//
//  Created by Andrew Ziber on 12/6/19.
//  Copyright © 2019 Andrew Ziber. All rights reserved.
//

import Foundation

class ConversionType {
    var wow = 0
    var decimal = false
    
    let convertArray: Array<Conversions> = [
        Conversions(labelCon: "Farenheit to Celsius", inputCon: " F", outputCon: " C"),
        Conversions(labelCon: "Celsius to Farenheit", inputCon: " F", outputCon: " C"),
        Conversions(labelCon: "Miles to Kilometers", inputCon: " MI", outputCon: " KM"),
        Conversions(labelCon: "Kilometers to Miles", inputCon: " KM", outputCon: " MI")]
    
    
       func convert(_ inputNumber: Double) -> Double{
        switch wow {
        case 0:
            let x = Double((inputNumber - 32)/(9/5))
            let y = Double(round(1000*x)/1000)
            return y
        case 1:
            let x = Double((inputNumber * 9/5) + (32))
            let y = Double(round(1000*x)/1000)
            return y
        case 2:
            let x = Double(inputNumber * 1.609344)
            let y = Double(round(1000*x)/1000)
            return y
        case 3:
            let x = Double(inputNumber/1.609344)
            let y = Double(round(1000*x)/1000)
            return y
        default:
            return 0
        }
            
    }
}

