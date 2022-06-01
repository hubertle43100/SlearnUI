//:Playground - noun: a place where people can play

import UIKit

var optionalNumber: Int?
//optionalNumber = 23

//IF LET

if let number = optionalNumber {
    print("There is a number value of \(number)")
} else {
    print("Number is nil")
}

//GUARD

func tripleTimes(number: Int?) {
    
    guard let number = number else {
        print("Exiting function")
        return
    }
    
    print("\(number) X 3 = \(number * 3)")
}

tripleTimes(number: 23)

//FORCE UNWRAPPING
//let forcedNumber = optionalNumber!

//OPTIONAL CHAINING

struct Device {
    var name: String
    var price: Float
    var type: String
}

var myPhone: Device?
myPhone = Device(name: "iPhone 11", price: 699.00, type: "Space gray")

let devicePrice = myPhone?.price

if let devicePrice = devicePrice {
    print("My total is ... \(devicePrice + 8.99)")
}
