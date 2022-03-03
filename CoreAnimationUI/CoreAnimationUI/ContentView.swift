//
//  ContentView.swift
//  CoreAnimationUI
//
//  Created by Hubert Le on 2/24/22.
//

import SwiftUI

struct ContentView: View {
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    
    @State var positionX = -150
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(rotation))
            .scaleEffect(CGFloat(scaleXY))
            .offset(x: CGFloat(positionX))
            .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true).speed(4))
            .onAppear {
                rotation += 360
                scaleXY += 1.1
                positionX += 250
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
