//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 28/08/23.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var isAnimating: Bool = false
    
    // MARK: - Random parameters
    @State private var numberOfCircles = Int.random(in: 12...16)
    
    private func randoomCoordinates(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    private func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 10...300))
    }
    
    private func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    private func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    private func randomDelay() -> Double {
        Double.random(in: 0...2)
    }

    
    var body: some View {
        // this component give acces to the parent view width and height
        // when using it, the origin point related to x and y coordinates become the top leading point of the screen instead of the center
        GeometryReader { geometry in
            ZStack {
                ForEach(0...numberOfCircles, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randoomCoordinates(max: geometry.size.width),
                            y: randoomCoordinates(max: geometry.size.height)
                        )
                        .onAppear {
                            withAnimation(
                                .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            ) {
                                isAnimating = true
                            }
                        }
                }
            }
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
