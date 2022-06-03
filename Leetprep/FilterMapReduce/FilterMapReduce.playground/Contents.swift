import UIKit

struct Device {
    var type: String
    var price: Float
    var color: String
}

var myiMacPro           = Device(type: "iMac Pro", price: 4999.00, color: "Space Grey")
var myiPhone6Plus       = Device(type: "iPhone", price: 799.00, color: "White")
var myiPhone7           = Device(type: "iPhone", price: 699.00, color: "Black")
var myiPad              = Device(type: "iPad", price: 599.00, color: "Space Grey")
var myAppleWatch        = Device(type: "Apple Watch", price: 349.00, color: "Space Grey")
var myAppleTV           = Device(type: "AppleTV", price: 199.00, color: "Black")

let myDevices = [myiMacPro, myiPhone6Plus, myiPhone7, myiPad, myAppleWatch, myAppleTV]

// == FILTER == (filtering out something from array)

let iPhones = myDevices.filter ({ return $0.type == "iPhone"}) //$0 = device
print(iPhones)

        //(OLD WAY)
                //var myPhones: [Device] = []
                //for device in myDevices {
                //    if device.type == "iPhone" {
                //        myPhones.append(device)
                //    }
                //}
                //print(myPhones)

// == MAP == (iterate over the array & transform/operate on every object on the array)
let canadianPrices: [Float] = myDevices.map({ return $0.price * 1.2})
print(canadianPrices)

// == REDUCE ==
let totalCanadianPrices: Float = canadianPrices.reduce(827.2, +)
print(totalCanadianPrices)

        //(OLD WAY)
            //var totalPrice: Float = 0.0
            //
            //for price in canadianPrices {
            //    totalPrice += price
            //}
            //print(totalPrice)


