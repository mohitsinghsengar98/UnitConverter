//
//  VolumeConversionView.swift
//  UnitConverter
//
//  Created by Mohit Sengar on 14/11/25.
//

import SwiftUI

struct VolumeConversionView:View {
    let type = "volume"
    @State private var selectedInputLengthType:VolumeUnit = .mL
    @State private var selectedOutputLengthType:VolumeUnit = .L
    @State private var inputLengthValue = 0.00
    @FocusState private var showInputFocused : Bool
    
    private var outputValue:Double {
        
        let meters = inputLengthValue * selectedInputLengthType.toMilliliters
        return meters / selectedOutputLengthType.toMilliliters

    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("Unit Descriptions: mL - Mili-Litres, L - Litres, c - Cups, pt - Pints, gal - Gallons.").font(.headline).padding()
                    Form{
                        Section{
                            HStack {
                                TextField("Enter the input \(type) value", value: $inputLengthValue, format: .number)
                                    .focused($showInputFocused)
                                Text(selectedInputLengthType.rawValue).font(.headline)
                            }
                        }header:{ Text("Select input \(type) value") }
                        
                        Section{
                            Picker("Select the \(type) type", selection: $selectedInputLengthType) {
                                ForEach(VolumeUnit.allCases, id:\.self){
                                    Text($0.rawValue)
                                }
                            }.pickerStyle(.segmented)
                        }header:{ Text("Select input \(type) type") }
                        
                        Section{
                            Picker("Select the \(type) type", selection: $selectedOutputLengthType) {
                                ForEach(VolumeUnit.allCases, id:\.self){
                                    Text($0.rawValue)
                                }
                            }.pickerStyle(.segmented)
                        }header:{ Text("Select output \(type) type") }
                        
                        Section{
                            HStack{
                                Text(outputValue.formatted())
                                Text(selectedOutputLengthType.rawValue)
                            }.font(.headline)
                        }header:{ Text("Result") }
                        
                    }.navigationTitle("\(type.capitalized) Conversion")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItemGroup(placement: .keyboard){
                                Spacer()
                                Button("Done"){
                                    showInputFocused = false
                                }
                            }
                        }
                }.background(Color(.systemGroupedBackground))
            }
        }
    }
}

enum VolumeUnit: String, CaseIterable {
    case mL = "milliliters"
    case L = "liters"
    case c = "cups"
    case pt = "pints"
    case gal = "gallons"

    /// Conversion factor to meters
    var toMilliliters: Double {
        switch self {
        case .mL: return 1
        case .L: return 1000
        case .c: return 236.58824
        case .pt: return 473.17684
        case .gal: return 3785.4
        }
    }
}

#Preview {
    VolumeConversionView()
}
