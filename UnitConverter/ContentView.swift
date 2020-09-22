//
//  ContentView.swift
//  UnitConverter
//
//  Created by Juliette Rapala on 9/21/20.
//  Copyright © 2020 Juliette Rapala. All rights reserved.
//

import SwiftUI

// TODO: Use enums
// TODO: DRY code
// TODO: Temperature conversion: users choose Celsius, Fahrenheit, or Kelvin.
// TODO: Length conversion: users choose meters, kilometers, feet, yards, or miles.
// TODO: Volume conversion: users choose milliliters, liters, cups, pints, or gallons.
// TODO: Use Apple's unit types. More info @ https://www.hackingwithswift.com/example-code/system/how-to-convert-units-using-unit-and-measurement

struct ContentView: View {
    @State private var valueToConvert = ""
    @State private var fromUnit = 0
    @State private var toUnit = 0

    let timeUnits = ["seconds", "minutes", "hours", "days"]

    func convertToSeconds(_ value: Double) -> Double {
        switch timeUnits[fromUnit] {
            case "seconds":
                return value
            case "minutes":
                return value * 60
            case "hours":
                return value * 60 * 60
            case "days":
                return value * 60 * 60 * 24
            default:
                return value
        }
    }
    
    func convertSecondsToUnit(_ value: Double) -> Double {
        switch timeUnits[toUnit] {
            case "seconds":
                return value
            case "minutes":
                return value / 60
            case "hours":
                return value / 60 / 60
            case "days":
                return value / 60 / 60 / 24
            default:
                return value
        }
    }

    var result: Double {
        let input = Double(valueToConvert) ?? 0
        let inputInSeconds = convertToSeconds(input)
        return convertSecondsToUnit(inputInSeconds)
    }

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
                
                Section(header: Text("Value to convert (in \(timeUnits[fromUnit]))")) {
                    TextField("Enter a value", text: $valueToConvert)
                }
                
                Section(header: Text("Result (in \(timeUnits[toUnit]))")) {
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
