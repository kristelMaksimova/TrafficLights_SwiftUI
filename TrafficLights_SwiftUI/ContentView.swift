//
//  ContentView.swift
//  TrafficLights_SwiftUI
//
//  Created by Kristel Maximova on 20.01.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    
    @State private var currentLight = CurrentLight.red
    
    @State private var redLight = 0.3
    @State private var yellowLight = 0.3
    @State private var greenLight = 0.3
    
    private func nextColor() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch currentLight {
        case .red:
            greenLight = lightIsOff
            redLight = lightIsOn
            currentLight = CurrentLight.yellow
        case .yellow:
            redLight = lightIsOff
            yellowLight = lightIsOn
            currentLight = CurrentLight.green
        case .green:
            yellowLight = lightIsOff
            greenLight = lightIsOn
            currentLight = CurrentLight.red
        }
    }
}
extension ContentView {
    
    var body: some View {
        ZStack {
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorLight(color: .red, opacity: redLight)
                ColorLight(color: .yellow, opacity: yellowLight)
                ColorLight(color: .green, opacity: greenLight)
                
                Spacer()
                ChangeColorButton(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    nextColor()
                }
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

