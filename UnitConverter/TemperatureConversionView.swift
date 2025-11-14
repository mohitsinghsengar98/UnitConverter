//
//  TempratureConversionView.swift
//  UnitConverter
//
//  Created by Mohit Sengar on 14/11/25.
//

import SwiftUI

struct TemperatureConversionView:View {
    let type = "temperature"
    @State private var selectedInputTemperatureType :TemperatureUnit = .C
    @State private var selectedOutputTemperatureType :TemperatureUnit = .F
    @State private var inputLengthValue = 0.00
    @FocusState private var showInputFocused : Bool
    
    private var outputValue:Double {
        
        switch(selectedInputTemperatureType, selectedOutputTemperatureType){
        case (TemperatureUnit.C,.F):
            return (inputLengthValue * 9/5) + 32
        case (TemperatureUnit.C,.K):
            return inputLengthValue + 273.15
        case (.F,TemperatureUnit.C):
            return (inputLengthValue - 32) * 5/9
        case (.F,.K):
            return ((inputLengthValue - 32) * 5/9) + 273.15
        case (.K,.F):
            return ((inputLengthValue - 273.15) * 9/5) + 32
        case (.K,TemperatureUnit.C):
            return inputLengthValue - 273.15
        default:
            return inputLengthValue
        }

    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack {
                        TextField("Enter the input \(type) value", value: $inputLengthValue, format: .number)
                            .focused($showInputFocused)
                        Text(selectedInputTemperatureType.rawValue).font(.headline)
                    }
                }header:{ Text("Select input \(type) value") }
                
                Section{
                    Picker("Select the \(type) type", selection: $selectedInputTemperatureType) {
                        ForEach(TemperatureUnit.allCases, id:\.self){
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                }header:{ Text("Select input \(type) type") }
                
                Section{
                    Picker("Select the \(type) type", selection: $selectedOutputTemperatureType) {
                        ForEach(TemperatureUnit.allCases, id:\.self){
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                }header:{ Text("Select output \(type) type") }
                
                Section{
                    HStack{
                        Text(outputValue.formatted())
                        Text(selectedOutputTemperatureType.rawValue)
                    }.font(.headline)
                }header:{ Text("Result") }
                
            }.navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement:.keyboard){
                    Spacer()
                    Button("Done"){
                        showInputFocused = false
                    }
                }
            }
        }
    }
}

enum TemperatureUnit: String, CaseIterable {
    case C = "°C"
    case F = "°F"
    case K = "K"

    /// Conversion factor to meters
    var toCelcius: Double {
        switch self {
        case .C: return 1
        case .F: return (1 * 9/5) + 32
        case .K: return 273.15
        }
    }
}

#Preview {
    TemperatureConversionView()
}
