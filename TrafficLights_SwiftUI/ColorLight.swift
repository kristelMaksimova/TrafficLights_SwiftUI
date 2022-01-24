//
//  RedCircleUIView.swift
//  TrafficLights_SwiftUI
//
//  Created by Kristel Maximova on 20.01.2022.
//

import SwiftUI

struct ColorLight: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 90, height: 90)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct RedCircleUIView_Previews: PreviewProvider {
    static var previews: some View {
        ColorLight(color: .red, opacity: 1)
    }
}
