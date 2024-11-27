//
//  AddNewCar.swift
//  CustomNavigationStack
//
//

import SwiftUI

struct AddNewCarView: View {
    
    @State var carStore : CarStore
    @Binding var path: NavigationPath
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""

    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
    
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }.padding()
            }
            
            Button(action: addNewCar) {
                    Text("Add Car")
                }
            }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID(),
                      name: name, desc: description,
                      isHybrid: isHybrid, imageName: "tesla_model_3" )
        
        carStore.cars.append(newCar)
        path.removeLast()
    }
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
/*
#Preview {
    AddNewCarView(carStore: CarStore())
}
*/
