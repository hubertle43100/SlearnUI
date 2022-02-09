//
//  ContentView.swift
//  APICalls
//
//  Created by Hubert Le on 2/1/22.
//

import SwiftUI

//4. create a model that matches courses in JSON (make sure name match correctly)
struct Course: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    //6. initialize published property
    @Published var courses: [Course] = [] //++ array changes then View changes
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { //1. URL object
            return
        }
        
        //2. perform api call
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, //++ weak self: to not cause memory leak
            error in
            guard let data = data , error == nil else { //3. validate that we got data back && no errors
                return
            }
            
            //5. Convert to JSON to object
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data) //++ arry of courses
                DispatchQueue.main.async { //++ trigger an UI update
                    self?.courses = courses
                }
            }
            catch {
                print(error)
            }
        }
        task.resume() //6. start the api calling
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
                        Image("")
                            .frame(width: 130, height: 70)
                            .background(Color.gray)
                        
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
