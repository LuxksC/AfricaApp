//
//  DefaultButtonStyle.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 16/08/23.
//

import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        let enabledBackground = Color.accentColor
        
        return configuration.label
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, minHeight: 28)
            .padding(.all, 8)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(enabledBackground)
            .clipShape(Capsule())
    }
}
