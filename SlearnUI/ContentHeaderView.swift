//
//  ContentHeaderView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/18/21.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Surf Board")
                    .resizable()
                    .scaledToFit()
                Text("Huli Pizza Company")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            Text("Order Pizza")
                .font(.largeTitle)
        }
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
    }
}
