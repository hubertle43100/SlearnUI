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
            Text("Huli Pizza Company")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Image("Surf Board")
                .resizable()
                .scaledToFit()
            Text("Order Pizza")
                .font(.largeTitle)
            Spacer()
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
