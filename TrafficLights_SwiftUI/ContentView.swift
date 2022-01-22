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
    
    @State var currentLight = CurrentLight.red
    
    @State var redLight = false
    @State var yellowLight = false
    @State var greenLight = false
    
    var body: some View {
        ZStack {
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                VStack() {
                    CircleUIView(color: .red, opacity: redLight)
                    CircleUIView(color: .yellow, opacity: yellowLight)
                    CircleUIView(color: .green, opacity: greenLight)
                    Spacer()}
                VStack {
                    Button(action: {
                        switch currentLight {
                        case .red:
                            greenLight = false
                            redLight = true
                            currentLight = CurrentLight.yellow
                        case .yellow:
                            redLight = false
                            yellowLight = true
                            currentLight = CurrentLight.green
                        case .green:
                            yellowLight = false
                            greenLight = true
                            currentLight = CurrentLight.red
                        }
                    },
                           label: { if redLight == true || greenLight == true || yellowLight == true {
                               Text("NEXT")
                           } else {
                               Text("START")
                           }
                    })
                    
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        .background(.blue)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 3))
                        .cornerRadius(15)
                        .padding()
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
                    .previewInterfaceOrientation(.portrait)
            }
        }
    }
}
