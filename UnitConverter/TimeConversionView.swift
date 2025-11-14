//
//  TimeConversionView.swift
//  UnitConverter
//
//  Created by Mohit Sengar on 14/11/25.
//

import SwiftUI

struct TimeConversionView:View {
    let type = "time"
    let lengthType = ["s", "min", "hr", "d"]
    @State private var selectedInputLengthType = "s"
    @State private var selectedOutputLengthType = "min"
    @State private var inputLengthValue = 0.00
    @FocusState private var showInputFocused : Bool
    
    private var outputValue:Double {
        guard let inputUnit = TimeUnit(rawValue: selectedInputLengthType), let outputUnit = TimeUnit(rawValue: selectedOutputLengthType)
        else {
            return 0
        }
        
        let meters = inputLengthValue * inputUnit.toSeconds
        
        return meters / outputUnit.toSeconds

    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack {
                        TextField("Enter the input \(type) value", value: $inputLengthValue, format: .number)
                            .focused($showInputFocused)
                        Text(selectedInputLengthType).font(.headline)
                    }
                }header:{ Text("Select input \(type) value") }
                
                Section{
                    Picker("Select the \(type) type", selection: $selectedInputLengthType) {
                        ForEach(lengthType, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }header:{ Text("Select input \(type) type") }
                
                Section{
                    Picker("Select the \(type) type", selection: $selectedOutputLengthType) {
                        ForEach(lengthType, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }header:{ Text("Select output \(type) type") }
                
                Section{
                    HStack{
                        Text(outputValue.formatted())
                        Text(selectedOutputLengthType)
                    }.font(.headline)
                }header:{ Text("Result") }
                
            }.navigationTitle("Time Conversion")
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

enum TimeUnit: String, CaseIterable {
    case s = "s"
    case min = "min"
    case hr = "hr"
    case d = "d"
    

    /// Conversion factor to meters
    var toSeconds: Double {
        switch self {
        case .s: return 1
        case .min: return 60
        case .hr: return 3600
        case .d: return 86400
        }
    }
}

#Preview {
    TimeConversionView()
}
