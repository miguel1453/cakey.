//
//  NewOrderView.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/7/22.
//

import SwiftUI

struct NewOrderView: View {
    @ObservedObject var vm: CakesViewModel
    @Binding var showsheet: Bool
    @State var cake: Cake = Cake()
    var backgroundColor = Color(red: 34, green: 39, blue: 195)
  
    
    let sizes = ["Pequeño", "Mediano", "Grande"]
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text("New Order")
                .font(.title2)
                .fontWeight(.bold)
            List {
                TextField("Nombre y Appellido", text: $cake.customer_name)
                TextField("Numero de celular", text: $cake.customer_number)
                Section {
                    DatePicker("Date & Time", selection: $cake.date, in: Date()...)
                        .datePickerStyle(.graphical)
                }
                Section {
                    Picker("Tamaño", selection: $cake.size) {
                        ForEach(sizes, id: \.self) { size in
                            Text(size)
                        }
                    }
                    ColorPicker("Color", selection: $cake.color,supportsOpacity: false)
                    TextField("Dedicatoria", text: $cake.message)
                    TextField("Dibujo", text: $cake.image)
                }
                Section {
                    TextField("Commentarios", text: $cake.comments)
                }
                HStack {
                    Spacer()
                    Button {
                        vm.cakes.append(cake)
                        vm.sort()
                        showsheet.toggle()
                    } label: {
                        Text("Submit")
                            .font(.headline)
                    }
                    Spacer()
                }
            }
            
        }
    }
}

struct NewOrderView_Previews: PreviewProvider {
    @State static var value = false
    @State static var vm = CakesViewModel()
    static var previews: some View {
        
        NewOrderView(vm: vm, showsheet: $value, cake: Cake())
    }
}
