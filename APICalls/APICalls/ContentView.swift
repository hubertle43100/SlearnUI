//
//  ContentView.swift
//  APICalls
//
//  Created by Hubert Le on 2/1/22.
//

import SwiftUI

//10. introduce custom view
struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        }
        else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data,_,_ in
            self.data = data
            
        }
        task.resume()
    }
}

struct ContentView: View {
    //7. create instance of ViewModel
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List { //9. show contents of the model
                ForEach(viewModel.courses, id: \.self) { course in //++ id needs to have Hashable
                    HStack {
                        URLImage(urlString: course.image)
                        Text(course.name)
                            .bold()
                    }.padding(3)
                }
            }.navigationTitle("Courses")
        }
        //8. fetch the array of courses when view is shown
        .onAppear{
            viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
