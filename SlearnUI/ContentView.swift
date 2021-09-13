//
//  ContentView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    //var pizza: Int
    @ObservedObject var orderModel: OrderModel
    @State var isMenuDisplayed: Bool = true
    var body: some View {
        //Text(pizza > 5 ? "Helloo Pizza!!!!" : "Hello World")
        VStack {
//            ContentHeaderView()
//                .layoutPriority(2)
            Button(action: {self.isMenuDisplayed.toggle()}) {
                PageTitleView(title: "Order Pizza",
                isDisplayingOrders: isMenuDisplayed)
            }
            MenuListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
            OrderListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
                .animation(.spring())
           // Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(orderModel: OrderModel())
                .environmentObject(UserPreferences())
            ContentView(orderModel: OrderModel())
                .environmentObject(UserPreferences())
                .colorScheme(.dark)
                .background(Color.black)
                .previewDevice("iPad Pro (9.7-inch)")
            //ContentView(pizza: 5)
        }
    }
}
