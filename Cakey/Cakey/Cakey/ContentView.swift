//
//  ContentView.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CakesViewModel()
    @State var showsheet = false
    @State private var selection = 0
   
    var body: some View {
        NavigationStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text("Ordenes de Pastel")
                .font(.title2)
                .fontWeight(.bold)
            List(vm.cakes) { cake in
                NavigationLink {
                    CakeInfoView(cake: cake)
                } label: {
                    Text("\(cake.date, style: .date) | \(cake.customer_name)")
                }
            }
            .sheet(isPresented: $showsheet) {
                NewOrderView(vm: vm, showsheet: $showsheet, cake: Cake())
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showsheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
//        TabView (selection: $selection) {
//
//            CakeOrders(vm: vm)
//                .badge(vm.cakes.count)
//                .tabItem() {
//                    Image(systemName: "birthday.cake")
//                }
//                .tag(0)
//            NewOrderView(vm: vm)
//                .tabItem() {
//                    Image(systemName: "plus.circle")
//                }
//                .tag(1)
////            TodayCakes(vm: vm)
////                .tabItem() {
////                    Image(systemName: "heart")
////                }
////                .tag(2)
//
//        }
//        .accentColor(Color("yellow"))
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
