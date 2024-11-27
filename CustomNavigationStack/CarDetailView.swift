//
//  CarDetailView.swift
//  CustomNavigationStack
//

import SwiftUI

struct CarDetailView: View {
    
    let selectedCar: Car

    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
                Text(selectedCar.name)
                    .font(.headline)
            
                Text(selectedCar.desc)
                    .font(.body)
        
                HStack {
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ?
                            "checkmark.circle" : "xmark.circle" )
                }
            }
        }
    }
}

#Preview {
    CarDetailView(selectedCar: CarStore().cars.first!)
}
