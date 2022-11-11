//
//  Cake.swift
//  Cakey
//
//  Created by Miguel Villasenor on 11/8/22.
//

import Foundation
import SwiftUI

struct Cake: Identifiable {
    
    let id = UUID()
    
    var customer_name = ""
    var customer_number = ""
    var date = Date()
    var size = ""
    var color = Color(.blue)
    var message = ""
    var image = ""
    var comments = ""
}
