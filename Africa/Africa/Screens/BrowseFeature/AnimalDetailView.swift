//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 21/08/23.
//

import SwiftUI

struct AnimalDetailView: View {
    var animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .frame(height: 6)
                            .foregroundColor(.accentColor)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                
                // GALLERRY
                Group {
                    HeadingView(image: "photo.on.rectangle.angled", title: "Wilderness in Pictures")
                    
                    InsetGalleryView(images: animal.gallery)
                }
                .padding(.horizontal)
                
                // FACTS
                Group {
                    HeadingView(image: "questionmark.circle", title: "Did you know?")
                    
                    FactsInsetView(facts: animal.fact)
                }
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                    HeadingView(image: "info.circle", title: "All about")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // MAP
                Group {
                    HeadingView(image: "map", title: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                Group {
                    HeadingView(image: "books.vertical", title: "Learn More")
                    
                    ExternalWeblinkView(link: animal.link, linkLabel: animal.name)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static var animal: Animal = ModelSamples.animal
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animal)
        }
    }
}
