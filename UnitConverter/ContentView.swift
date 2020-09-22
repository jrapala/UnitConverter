//
//  ContentView.swift
//  UnitConverter
//
//  Created by Juliette Rapala on 9/21/20.
//  Copyright © 2020 Juliette Rapala. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var valueToConvert = ""
    @State private var fromUnit = 0
    @State private var toUnit = 0
    @State private var result = 0

    let timeUnits = ["seconds", "minutes", "hours", "days"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert from")) {
                    Picker("Convert From", selection: $fromUnit) {
                        ForEach(0 ..< timeUnits.count) {
                            Text("\(self.timeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert to")) {
                    Picker("Convert To", selection: $toUnit) {
                        ForEach(0 ..< timeUnits.count) {
                            Text("\(self.timeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Value to convert")) {
                    TextField("Enter a value", text: $valueToConvert)
                }
                
                Section(header: Text("Result")) {
                    Text("\(result)")
                }
                
            }
            .navigationBarTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
