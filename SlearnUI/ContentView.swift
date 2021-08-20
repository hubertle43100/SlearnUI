//
//  ContentView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    //var pizza: Int
    var body: some View {
        //Text(pizza > 5 ? "Helloo Pizza!!!!" : "Hello World")
        VStack {
            ContentHeaderView()
                .layoutPriority(2)
            PageTitleView(title: "Order Pizza")
            MenuListView()
                .layoutPriority(1)
            OrderListView()
                .layoutPriority(1)
            
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
