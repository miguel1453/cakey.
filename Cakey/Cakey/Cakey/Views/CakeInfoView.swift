//
//  CakeInfoView.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/8/22.
//

import SwiftUI

struct CakeInfoView: View {
    var cake: Cake
    var body: some View {
        VStack {
            Text(cake.customer_name)
            Text("Numero: \(cake.customer_number)")
            List {
                HStack {
                    Text(cake.date, style: .date)
                    Text(cake.date, style: .time)
                }
                HStack {
                    Text("Color: ")
                    cake.color
                }
                Text("Tamaño: \(cake.size)")
                Text("Dedicatoria: \"\(cake.message)\"")
                Text("Dibujo: \(cake.image)")
                Text("Commentarios: \(cake.comments)")


            }
        }
        
    }
}

struct CakeInfoView_Previews: PreviewProvider {
    @State static var cake = Cake(customer_name: "Miguel Villasenor", customer_number: "9107422001", date: Date(), size: "medium", color: Color(.blue), message: "Happy Birthday", image: "balloons", comments: "Please add extra tres leches mix. and bread should be chocolate")
    static var previews: some View {
        CakeInfoView(cake: cake)
    }
}
