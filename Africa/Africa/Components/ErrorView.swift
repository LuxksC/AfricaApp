//
//  ErrorView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 15/08/23.
//

import SwiftUI

struct ErrorView: View {
    var message: String
    var tryAgainAction: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "exclamationmark.triangle")
                .foregroundColor(.accentColor)
                .font(.system(size: 120))
            
            VStack(spacing: 8) {
                Text("App presented a problem\nPlease, contact the developer")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                Text("Error: \(message)")
                    .font(.footnote)
                    .foregroundColor(.red)
            }
            
            Button("Tente novamente", action: tryAgainAction)
                .buttonStyle(DefaultButtonStyle())
                .padding(.horizontal, 40)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Testing the error code message") {
            print("tryAgainAction called")
        }
        
        ErrorView(message: "Testing the error code message") {
            print("tryAgainAction called")
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        .previewDisplayName("iPhone 8")
    }
}
