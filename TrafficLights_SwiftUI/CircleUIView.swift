//
//  RedCircleUIView.swift
//  TrafficLights_SwiftUI
//
//  Created by Kristel Maximova on 20.01.2022.
//

import SwiftUI

struct CircleUIView: View {
    
    let color: Color
    let opacity: Bool
    
     let lightIsOn: Double = 1
     let lightIsOff: Double = 0.4
    
    
    var body: some View {
        Circle()
            .foregroundColor(color.opacity(opacity ? lightIsOn : lightIsOff))
            .frame(width: 90, height: 90)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
    }
}

struct RedCircleUIView_Previews: PreviewProvider {
    static var previews: some View {
        CircleUIView(color: .red, opacity: false)
    }
}
