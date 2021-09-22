//
//  PageTitleView.swift
//  SlearnUI
//
//  Created by Hubert Le on 8/18/21.
//

import SwiftUI

let staticFont = Font.system(size: 22)

struct PageTitleView: View {
    @Environment(\.verticalSizeClass) var sizeClass
    var title: String
    var isDisplayingOrders: Bool! = nil
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(sizeClass != .compact ? .largeTitle : staticFont)
                .fontWeight(.heavy)
                .padding(.trailing)
        }.overlay(
            Image(systemName:  "chevron.up.square")
                .rotationEffect(isDisplayingOrders ?? false ? Angle(degrees: 0.0) : Angle(degrees: 180.0))
                .animation(.easeInOut(duration: 0.5))
                .font(sizeClass != .compact ? .title : staticFont)
                .foregroundColor(isDisplayingOrders != nil ? Color("G1") : .clear)
                .padding(),
                alignment: .leading
        )
        .foregroundColor(Color("G1"))
        .background(Color("G4"))
    }
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(title: "Order Pizza", isDisplayingOrders: true)
    }
}
