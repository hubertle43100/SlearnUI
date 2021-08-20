//
//  PageTitleView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/18/21.
//

import SwiftUI

struct PageTitleView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.light)
            Spacer()
        }.overlay(
            Image(systemName: "chevron.up.square")
                .font(.title)
                .padding(),
                alignment: .trailing
        )
    }
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(title: "Order Pizza")
    }
}
