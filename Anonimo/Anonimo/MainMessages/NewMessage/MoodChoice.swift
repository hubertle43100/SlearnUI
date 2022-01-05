//
//  MoodChoice.swift
//  Anonimo
//
//  Created by Hubert Le on 12/20/21.
//

import SwiftUI

struct MoodChoice: View {
    @State private var happy: Bool = false
    @State private var sad: Bool = false
    @State private var laugh: Bool = false
    @State private var inlove: Bool = false
    @State private var angry: Bool = false
    @State private var nerd: Bool = false
    var body: some View {
        
        ScrollView(.horizontal) {
            VStack {
                HStack {
                    Button(action: {
                        self.happy = true
                        self.sad = false
                        self.laugh = false
                        self.inlove = false
                        self.angry = false
                        self.nerd = false
                    }) {
                        Option(image: "face.smiling", optionTitle: "Happy", colorHighlight: happy ? Color.green : Color.red, optionClicked: happy ? Color.white : Color.black)
                            .padding(.trailing,1)
                    }
                    Button(action: {
                        self.happy = false
                        self.sad = true
                        self.laugh = false
                        self.inlove = false
                        self.angry = false
                        self.nerd = false
                    }) {
                        Option(image: "cloud.bolt.rain.fill", optionTitle: "Sad", colorHighlight: sad ? Color.green : Color.red, optionClicked: sad ? Color.white : Color.black)
                            .padding(.trailing,1)
                    }
                    Button(action: {
                        self.happy = false
                        self.sad = false
                        self.laugh = true
                        self.inlove = false
                        self.angry = false
                        self.nerd = false
                    }) {
                        Option(image: "speaker.wave.3.fill", optionTitle: "Laugh", colorHighlight: laugh ? Color.green : Color.red, optionClicked: laugh ? Color.white : Color.black)
                    }
                    Button(action: {
                                        self.happy = false
                                        self.sad = false
                                        self.laugh = false
                                        self.inlove = true
                                        self.angry = false
                                        self.nerd = false
                                    }) {
                                        Option(image: "heart.fill", optionTitle: "In Love", colorHighlight: inlove ? Color.green : Color.red, optionClicked: inlove ? Color.white : Color.black)
                                            .padding(.trailing,1)
                                    }
                                    Button(action: {
                                        self.happy = false
                                        self.sad = false
                                        self.laugh = false
                                        self.inlove = false
                                        self.angry = true
                                        self.nerd = false
                                    }) {
                                        Option(image: "exclamationmark.3", optionTitle: "Angry", colorHighlight: angry ? Color.green : Color.red, optionClicked: angry ? Color.white : Color.black)
                                            .padding(.trailing,1)
                                    }
                                    Button(action: {
                                        self.happy = false
                                        self.sad = false
                                        self.laugh = false
                                        self.inlove = false
                                        self.angry = false
                                        self.nerd = true
                                    }) {
                                        Option(image: "book.fill", optionTitle: "Nerd", colorHighlight: nerd ? Color.green : Color.red, optionClicked: nerd ? Color.white : Color.black)
                                    }
                                }
            }
        }
//            HStack {
//                Button(action: {
//                    self.happy = false
//                    self.sad = false
//                    self.laugh = false
//                    self.inlove = true
//                    self.angry = false
//                    self.nerd = false
//                }) {
//                    Option(image: "heart.fill", optionTitle: "In Love", colorHighlight: inlove ? Color.green : Color.red, optionClicked: inlove ? Color.white : Color.black)
//                        .padding(.trailing,1)
//                }
//                Button(action: {
//                    self.happy = false
//                    self.sad = false
//                    self.laugh = false
//                    self.inlove = false
//                    self.angry = true
//                    self.nerd = false
//                }) {
//                    Option(image: "exclamationmark.3", optionTitle: "Angry", colorHighlight: angry ? Color.green : Color.red, optionClicked: angry ? Color.white : Color.black)
//                        .padding(.trailing,1)
//                }
//                Button(action: {
//                    self.happy = false
//                    self.sad = false
//                    self.laugh = false
//                    self.inlove = false
//                    self.angry = false
//                    self.nerd = true
//                }) {
//                    Option(image: "book.fill", optionTitle: "Nerd", colorHighlight: nerd ? Color.green : Color.red, optionClicked: nerd ? Color.white : Color.black)
//                }
//            }
            
        }
    }


struct MoodChoice_Previews: PreviewProvider {
    static var previews: some View {
        MoodChoice()
    }
}

struct Option: View {
    var image: String
    var optionTitle: String
    var colorHighlight: Color
    var optionClicked: Color
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Image(systemName: image)
                        .font(.system(size: 30))
                        .foregroundColor(optionClicked)
                }.frame(width: 80, height: 80)
                    .background(colorHighlight)
                    .cornerRadius(100)
                    .padding(.bottom)
                Text(optionTitle)
                    .font(.system(size: 19).bold())
                    .padding(.bottom,1)
                    .foregroundColor(.black)
            }.frame(width: 120, height: 145)
                .background(Color(#colorLiteral(red: 0.9582590461, green: 0.9727497697, blue: 0.9765676856, alpha: 1)))
                .cornerRadius(20)
        }.frame(width: 122, height: 147)
            .background(colorHighlight)
            .cornerRadius(20)
    }
}
struct MyButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(.white)
      .background(configuration.isPressed ? Color.green : Color.blue)
      .cornerRadius(8.0)
  }

}
