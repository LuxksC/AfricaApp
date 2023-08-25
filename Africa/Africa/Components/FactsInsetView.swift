//
//  FactsInsetView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 21/08/23.
//

import SwiftUI

struct FactsInsetView: View {
    var facts: [String]
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(facts, id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct FactsInsetView_Previews: PreviewProvider {
    static var animal: Animal = ModelSamples.animal
    
    static var previews: some View {
        FactsInsetView(facts: animal.fact)
    }
}
