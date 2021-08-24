//
//  HistoryRowView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/18/21.
//

import SwiftUI

struct HistoryRowView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("1_100w")
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
            Text("Huli Chicken")
                .font(.title)
            Spacer()
        }.overlay(Image(systemName: "chevron.right.square"))
        .padding()
        .font(.title)
        .foregroundColor(Color("G3"))
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView()
    }
}
