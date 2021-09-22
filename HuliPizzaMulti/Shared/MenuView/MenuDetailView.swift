//
//  MenuDetailView.swift
//  Pizza
//  adaptive version for landscape.
//  creates two functions of views to be able to switch them between Hstack and Vstack.
//  Created by Steven Lipton on 12/26/20.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`

var size:Size = .medium
struct MenuDetailView: View {
    
   @EnvironmentObject var settings:UserPreferences
   @ObservedObject var orderModel:OrderModel
    @State var didOrder:Bool = false
    @State var quantity:Int = 1
    var menuItem:MenuItem
    var formattedPrice:String{
        String(format:"%3.2f",menuItem.price * Double(quantity) * size.rawValue)
    }
    func addItem(){
//        orderModel.add(menuID: menuItem.id)
        didOrder = true
    }
    
    func isCompactPortrait(geo:GeometryProxy)->Bool{
        return geo.size.height <= 414
    }
    
    func titleView()->some View{
         return
            GeometryReader{ geometry in
                
                HStack{
                    SelectedImageView(image: "\(self.menuItem.id)_250w")
                        .padding(5)
                    Text(self.menuItem.description)
                        .frame( width: geometry.size.width * 2/5)
                        .font( geometry.size.height > 200 ? .body : .caption)
                        .padding()
                    
                    Spacer()
                }
            }
                
            }
    
    
    
    
    func menuOptionsView(geo: GeometryProxy)-> some View{
       return  VStack{
            SizePickerView(size:$settings.size)
            QuantityStepperView(quantity:$quantity)
            PageTitleView(title: "Order:  \(formattedPrice)" , isCompact: isCompactPortrait(geo: geo))
            Spacer()
        }
    }
        
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                HStack{
                    PageTitleView(title: self.menuItem.name, isCompact: isCompactPortrait(geo: geo))
                    Button(action: self.addItem) {
                        Text("Add to order")
                            
                            .font(isCompactPortrait(geo : geo) ? staticFont : .title)
                            .fontWeight(.bold)
                            .padding([.leading,.trailing])
                            .background(Color("G3"))
                            .foregroundColor(Color("IP"))
                            .cornerRadius(5)
                    }
                    .sheet(isPresented: self.$didOrder){
                        ConfirmView(menuID: self.menuItem.id, isPresented: self.$didOrder, orderModel:self.orderModel, quantity: self.$quantity, size:self.$settings.size)
                    }
                }
                if isCompactPortrait(geo: geo){
                    HStack{
                        self.titleView()
                        self.menuOptionsView(geo: geo)
                    }
                } else {
                    VStack{
                        self.titleView()
                        self.menuOptionsView(geo: geo)
                    }
                }
                
                
            }//Root VStack
            .padding(.top, 5)
        }
            
    }// body
}// MenuDetailView
struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(orderModel:OrderModel(),menuItem: testMenuItem)
    }
}

struct QuantityStepperView: View {
    @Binding var quantity:Int
    var body: some View {
        Stepper(value: $quantity, in: 1...10){
            Text("Quantity \(quantity)")
        }
            .padding()
    }
}


struct SizePickerView: View {
    
    @Binding var size:Size
    let sizes:[Size] = [.small,.medium,.large]
    var body: some View {
        Picker(selection:$size, label:Text("Pizza Size")){
            ForEach(sizes, id:\.self){ size in
                Text(size.formatted()).tag(size)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .font(.headline)
    }
}

