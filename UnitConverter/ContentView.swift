//
//  ContentView.swift
//  UnitConverter
//
//  Created by Mohit Sengar on 14/11/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 35) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Select Unit Conversion Type")
                    .font(.title3)
                NavigationLink("Length Conversion") {
                    LengthConversionView()
                }
                .buttonStyle(.borderedProminent)
                NavigationLink("Temperature conversion") {
                    TemperatureConversionView()
                }.buttonStyle(.borderedProminent)
                NavigationLink("Time conversion") {
                    TimeConversionView()
                }.buttonStyle(.borderedProminent)
                NavigationLink("Volume conversion") {
                    VolumeConversionView()
                }.buttonStyle(.borderedProminent)
            }
            .padding(50)
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
