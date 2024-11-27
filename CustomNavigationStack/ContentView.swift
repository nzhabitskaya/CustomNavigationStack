//
//  ContentView.swift
//  CustomNavigationStack
//

import SwiftUI

struct ContentView: View {
    
    @State var carStore: CarStore = CarStore()
    @State private var stackPath = NavigationPath()

    var body: some View {
        
        NavigationStack(path: $stackPath) {
            List {
                ForEach($carStore.cars, id: \.self) { $car in
                    NavigationLink(value: car) {
                        ListCell(car: car)
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationDestination(for: Car.self) { car in
                CarDetailView(selectedCar: car)
            }
            .navigationDestination(for: String.self) { _ in
                AddNewCarView(carStore: carStore, path: $stackPath)
            }
            .navigationTitle(Text("EV Cars"))
                    .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                NavigationLink(value: "Add Car") { Text("Add") }
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                EditButton()
                            }
                        }

        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListCell: View {
    
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}

#Preview {
    ContentView()
}
