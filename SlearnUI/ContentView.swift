//
//  ContentView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    //var pizza: Int
    @State var isMenuDisplayed: Bool = true
    var body: some View {
        //Text(pizza > 5 ? "Helloo Pizza!!!!" : "Hello World")
        VStack {
            ContentHeaderView()
                .layoutPriority(2)
            Button(action: {self.isMenuDisplayed.toggle()}) {
                PageTitleView(title: "Order Pizza",
                isDisplayingOrders: isMenuDisplayed)
            }
            MenuListView()
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
            OrderListView()
                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
            
           // Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .colorScheme(.dark)
                .background(Color.black)
                .previewDevice("iPad Pro (9.7-inch)")
            //ContentView(pizza: 5)
        }
    }
}
