//
//  Car.swift
//  CustomNavigationStack
//

import SwiftUI
 
struct Car : Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    
    var desc: String
    var isHybrid: Bool
    
    var imageName: String
}
