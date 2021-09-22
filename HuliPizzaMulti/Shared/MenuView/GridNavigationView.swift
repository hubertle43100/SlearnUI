//
//  GridNavigationView.swift
//  HuliPizzaMulti_Play
//
//  Created by Steven Lipton on 12/29/20.
//

import SwiftUI

struct GridNavigationView:View {
    @ObservedObject var orderModel:OrderModel
    var menuList = MenuModel().menu
    let columns = Array(repeating: GridItem(.flexible(minimum: 60), spacing: 5), count: 2)
    let bigColumn = GridItem(.flexible(minimum: 100, maximum: 120), spacing: 10)
    var body: some View {
        ScrollView{
            VStack{
                ForEach(menuList){ menuPart in
                    HStack(alignment:.top){
                        VStack(alignment:.trailing){
                            Image("Surf Board")
                                .resizable()
                                .scaledToFit()
                                .padding(.bottom,10)
                            Text(menuPart.name).font(.headline)
                        }.frame(width:100)
                        //VStack{
                        LazyVGrid(columns: [bigColumn] + columns, spacing: 5){
                            if let children = menuPart.children{
                                ForEach(children){ child in
                                    NavigationLink(destination:MenuDetailView(orderModel:self.orderModel,menuItem:child)){
                                        VStack{
                                            Image("\(child.id)_100w")
                                                .resizable()
                                                .scaledToFit()
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    Divider()
                }
                Spacer()
            }
        }
    }
    
}

struct GridNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        GridNavigationView(orderModel:testOrderModel)
    }
}
