import UIKit

//Classes: reference types
//(Example) Sharing the same spreadsheet. Friend can mess up your copy
            //Change original

//Struct: value types
//(Example) Sharing a copy of spreadsheet. Friend can do anything on their copy
            //Change copy

class MacBook {
    var year: Int
    var color: String
    
    init(year: Int, color: String) {
        self.year = year
        self.color = color
    }
}

let myMacBook = MacBook(year: 2020, color: "Space Grey")
let stolenMacBook = myMacBook

stolenMacBook.color = "Spraypainted Green"
print(myMacBook.color)



struct iPhone {
    var number: Int
    var color: String
}

let myiPhone = iPhone(number: 7, color: "black")
let stoleniPhone = myiPhone

stoleniPhone.color = "Rose Gold"

print(myiPhone.color)



//class can have inheritence (have all properties of UIButton)
class myCustomButton: UIButton {
    
}

//structs are lightweight & clean since they have no inheritance

//basically structs > class (most often times)
