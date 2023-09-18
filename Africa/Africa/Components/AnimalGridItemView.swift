//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 04/09/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    var animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalGridItemView(animal: ModelSamples.animal)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
