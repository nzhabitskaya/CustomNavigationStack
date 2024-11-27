//
//  CarStore.swift
//  CustomNavigationStack
//

import SwiftUI
 
@Observable class CarStore: Identifiable {
    
    var cars: [Car] = [Car(name: "Tesla Model 3", desc: "Luxury 4-door.",
                              isHybrid: false, imageName: "tesla_model_3"),
                   Car(name: "Tesla Model S", desc: "5-door liftback.",
                              isHybrid: false, imageName: "tesla_model_s"),
                   Car(name: "Toyota Prius", desc: "5-door liftback",
                              isHybrid: false, imageName: "toyota_prius"),
                   Car(name: "Nissan Leaf", desc: "Compact five-door.",
                              isHybrid: false, imageName: "nissan_leaf"),
                   Car(name: "Chevrolet Volt", desc: "5-door hatchback.",
                              isHybrid: false, imageName: "chevrolet_volt")]
}
