//
//  LengthConversionView.swift
//  UnitConverter
//
//  Created by Mohit Sengar on 14/11/25.
//

import SwiftUI

struct LengthConversionView:View {
    let lengthType = ["m", "km", "ft", "yd", "mi"]
    @State private var selectedInputLengthType = "m"
    @State private var selectedOutputLengthType = "km"
    @State private var inputLengthValue = 0.00
    @FocusState private var showInputFocused : Bool
    
    private var outputValue:Double {
        guard let inputUnit = LengthUnit(rawValue: selectedInputLengthType), let outputUnit = LengthUnit(rawValue: selectedOutputLengthType)
        else {
            return 0
        }
        
        let meters = inputLengthValue * inputUnit.toMeters
        
        return meters / outputUnit.toMeters

    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack {
                        TextField("Enter the input length value", value: $inputLengthValue, format: .number)
                            .focused($showInputFocused)
                        Text(selectedInputLengthType).font(.headline)
                    }
                }header:{ Text("Select input length value") }
                
                Section{
                    Picker("Select the length type", selection: $selectedInputLengthType) {
                        ForEach(lengthType, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }header:{ Text("Select input length type") }
                
                Section{
                    Picker("Select the length type", selection: $selectedOutputLengthType) {
                        ForEach(lengthType, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }header:{ Text("Select output length type") }
                
                Section{
                    HStack{
                        Text(outputValue.formatted())
                        Text(selectedOutputLengthType)
                    }.font(.headline)
                }header:{ Text("Result") }
                
            }.navigationTitle("Length Conversion")
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

enum LengthUnit: String, CaseIterable {
    case m = "m"
    case km = "km"
    case ft = "ft"
    case yd = "yd"
    case mi = "mi"

    /// Conversion factor to meters
    var toMeters: Double {
        switch self {
        case .m: return 1
        case .km: return 1000
        case .ft: return 0.3048
        case .yd: return 0.9144
        case .mi: return 1609.34
        }
    }
}

#Preview {
    LengthConversionView()
}
