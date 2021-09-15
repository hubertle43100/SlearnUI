//
//  ContentView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var orderModel: OrderModel
    @State var isMenuDisplayed: Bool = true
    var body: some View {
        VStack {
            //--- Header ---
            Button(action: {self.isMenuDisplayed.toggle()}) {
                PageTitleView(title: "Order Pizza",
                isDisplayingOrders: isMenuDisplayed)
            }
            
            //--- Menu ---
            MenuListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
            OrderListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
                .animation(.spring())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //--- iPhone ---
            ContentView(orderModel: OrderModel())
                .environmentObject(UserPreferences())
            
            //--- iPad ---
            ContentView(orderModel: OrderModel())
                .environmentObject(UserPreferences())
                .colorScheme(.dark)
                .background(Color.black)
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
