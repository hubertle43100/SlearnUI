//
//  MenuListView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/16/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var orderModel:OrderModel
    var menuList = MenuModel().menu
    var body: some View {
        VStack {
            ListHeaderView(orderModel:orderModel,text:"Menu")
            NavigationView{
                #if os(macOS)
                List(menuList, children:\.children) { item in
                    if item.type != .title{
                    NavigationLink(destination:MenuDetailView(orderModel:self.orderModel,menuItem:item)){
                        MenuRowView(menuItem: item)
                            .listRowInsets(EdgeInsets())
                    }
                        
                    } else {
                        Text(item.name)
                    }
                }
                #else
                GridNavigationView(orderModel: orderModel)
                //List(menuList, children:\.children) { item in
//                List {
//                    OutlineGroup(menuList, children:\.children) { item in
//                        if item.type != .title{
//                            NavigationLink(destination:MenuDetailView(orderModel:self.orderModel,menuItem:item)){
//                                MenuRowView(menuItem: item)
//                                    .listRowInsets(EdgeInsets())
//                            }
//
//                        } else {
//                            Text(item.name)
//                        }
//                    }
//                }
            .navigationBarTitle("Pizza Order")
                #endif
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(orderModel:OrderModel())
    }
}



