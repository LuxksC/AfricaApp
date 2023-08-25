//
//  MapAnotationView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 25/08/23.
//

import SwiftUI

struct MapAnotationView: View {
    var location: ParkLocation
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.5).repeatForever(autoreverses: false)) {
                animation = 1.0
            }
        }
    }
}

struct MapAnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnotationView(location: ModelSamples.location)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
