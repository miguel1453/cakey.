//
//  CakeOrders.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/10/22.
//

import SwiftUI

struct CakeOrders: View {
    @ObservedObject var vm: CakesViewModel
    
    var body: some View {
        ZStack {
            Color.green
            NavigationStack {
               
                VStack {
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                    Text("Cake Orders")
                        .font(.title)
                        .fontWeight(.bold)
                    List(vm.cakes){ cake in
                        NavigationLink {
                            CakeInfoView(cake: cake)
                        } label: {
                            Text(cake.date, style: .date)
                            Text(" | ")
                            Text(cake.customer_name)
                        }
                        
                    }
                }
                 
            }
        }
        
    }
    struct CakeOrders_Previews: PreviewProvider {
        
        static var previews: some View {
            CakeOrders(vm: CakesViewModel())
        }
    }
}
