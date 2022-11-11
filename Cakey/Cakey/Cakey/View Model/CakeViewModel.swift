//
//  CakeViewModel.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/8/22.
//

import Foundation

class CakesViewModel: ObservableObject {
    
    @Published var cakes: [Cake] = []
    
    func sort() {
        cakes.sort {
            $0.date < $1.date
        }
    }

}
