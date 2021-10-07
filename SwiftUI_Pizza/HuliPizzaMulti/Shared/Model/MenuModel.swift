//
//  MenuModel.swift
//  Pizza and Dessert
//
//  Modified by Steven Lipton on 12/26/20.
// Added desserts and Recursive search 
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import Foundation

///The types of menu items
enum MenuItemType{
    case pizza,pasta,dessert,beverage,title
}

///A basic description of a menu item
///`name` the name of the food item
///`description` the decription of the food item
///`price` the base price for the menu item
///`rating` the rating for the menu item
struct MenuItem:Identifiable{
    var id:Int
    var name:String
    var description:String = ""
    var price:Double = 0.00
    var rating:Int = 0
    var type:MenuItemType = .pizza
    var children: [MenuItem]? = nil
}

let testMenuItem =  MenuItem(id:1, name: "Huli Chicken", description: "Our original Hawaiian street food pizza, with Huli Huli chicken, onions, ginger, crushed macadamia nuts, tomato sauce, and cheese on a classic crust.", price: 14.00, rating: 6)


struct MenuModel{
     var menu:[MenuItem] = [
        MenuItem(id: 100, name: "Pizza", type: .title, children: [
        MenuItem(id: 0,
                 name: "Margherita",
                 description: "The classic pizza of Buffalo Mozzarella, tomatoes, and basil on a classic crust.",
                 price: 12.00,
                 rating: 5,
                 type:.pizza ),
        MenuItem(id: 1,
                 name: "Huli Chicken",
                 description: "Our original Hawaiian street food pizza, with huli huli chicken, onions, ginger, crushed macadamia nuts, tomato sauce and cheese on a classic crust.",
                 price: 14.00,
                 rating: 6,
                 type:.pizza),
        MenuItem(id: 2,
                 name: "Quattro Formaggi",
                 description: "A blend of Asiago, Parmesan, buffalo mozzarella, and Gorgonzola on a thin crust.",
                 price: 13.00,
                 rating: 5,
                 type:.pizza),
        MenuItem(id: 3,
                 name: "Longboard",
                 description: "A very long flatbread for vegetarians and vegans, made with olive oil, mushrooms, garlic, fresh ginger, and macadamias, sweetened with lilikoi.",
                 price: 15.00,
                 rating: 4,
                 type:.pizza),
        MenuItem(id: 4,
                 name: "The Big Island",
                 description: "A meaty calzone exploding like a volcano. Beef and pork combined with vegetables, pineapple, and a special \"lava sauce\" leaking out the top crater. Definitely share this one.",
                 price: 17.00,
                 rating: 6,
                 type:.pizza),
        MenuItem(id: 5,
                 name: "Pepperoni",
                 description: "The New York Classic version. A thin crust with pizza sauce, cheese, and pepperoni.",
                 price: 10.00,
                 rating: 5,
                 type:.pizza),
        MenuItem(id: 6,
                 name: "Chicago Deep Dish",
                 description: "The classic deep dish cheese pizza. 2\"Thick and filled with sauce and cheese. ",
                 price: 17.00,
                 rating: 6,
                 type:.pizza),
        MenuItem(id: 7,
                 name: "Meat Lovers",
                 description: "A deep dish for the carnivore. Sausage and pepperoni in the classic Chicago deep dish.",
                 price: 20.00,
                 rating: 4,
                 type:.pizza),
        MenuItem(id: 8,
                 name: "BBQ Chicken",
                 description: "Grilled chicken with barbecue sauce, red onions, and peppers.",
                 price: 14.00,
                 rating: 5,type:.pizza),
        MenuItem(id: 9,
                 name: "Hawaiian",
                 description: "It may be from the mainland, but we make it our own. Pineapple, SPAM, cheese, onions, and tomato sauce on a thin crust.",
                 price: 14.00,
                 rating: 5,
                 type:.pizza)]),
        MenuItem(id: 200, name: "Dessert", type: .title, children: [
        MenuItem(id:21,
                 name:"ChocoMac Tart",
                 description:"Chocolate Cream with macadamias topped with wipped cream and locally sourced chocolate shavings",
                 price: 8.95,
                 rating:5,
                 type:.dessert),
        MenuItem(id:22,
                 name :"Cheesecake",
                 description:"A classic cheesecake with Strawberries",
                 price: 7.95,
                 rating:5,
                 type:.dessert),
        MenuItem(id:23,
                 name:"Tiramisu",
                 description:"Mascarpone cheese between layers of 100% Kona espresso ladyfingers, topped with locally sourced chocolate",
                 price: 8.95,
                 rating:5,
                 type:.dessert),
        MenuItem(id:24,
                 name:"Deep Dish Cookie",
                 description:"Deep dish cookie baked in our pizza oven to order then topped with your choice of ice cream",
                 price: 7.95,
                 rating:5,
                 type:.dessert),
        MenuItem(id:25,
                 name:"Mochi Sundae Deconstructed",
                 description:"Hot fudge and vanilla ice cream over a squre of butter mochi",
                 price: 8.95,
                 rating:5,
                 type:.dessert),
        MenuItem(id:26,
                 name:"Key Lime Pie",
                 description:"Key lime pie with coconut on a macadamia nut crust with coconut flakes",
                 price: 10.95,
                 rating:5,
                 type:.dessert),
        MenuItem(id:27,
                 name:"Pecan Pie",
                 description:"The classic Mainland pie with choice of ice cream",
                 price: 9.95,
                 rating:5,
                 type:.dessert),
        MenuItem(id:28,
                 name:"Cookie Sandwich",
                 description:"Your choice of ice cream between two of our chocolate chip cookies",
                 price: 8.95,
                 rating:5,
                 type:.dessert)])
    ]
// a basic recursive function
// factorial 5 = 5*4*3*2*1  whihc is the same as 5*(4*(3*(2*(1))))
    func factorial(_ n:Int)->Int{
        if n <= 1 {return 1}
        return n * factorial( n - 1)
    }
    
// a basic tree find recursive structure
/*
                    0
        |-----------|-----------|
        1                       2
     |------|               |--------|
     11     12              21      22
     
*/
    func findIn(model:MenuItem, id:Int)-> MenuItem! {
        if id == model.id {return model} //if found, return int
        if let children = model.children { //if there are children
            for child in children{ //iterate through children
                if let found = findIn(model: child, id: id){ //find a child
                    if found.id == id {return found} // if correct ID return the child
                }
            }
        }
        return nil // if anythng fails return nil
    }
}
