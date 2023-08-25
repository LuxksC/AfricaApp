//
//  AnimalsListRowView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 16/08/23.
//

import SwiftUI

struct AnimalsListRowView: View {
    var animal: Animal
    
    var body: some View {
        HStack {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                
            }
        }
    }
}

struct AnimalsListRowView_Previews: PreviewProvider {
    static var animal: Animal = ModelSamples.animal
    
    static var previews: some View {
        AnimalsListRowView(animal: animal)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
