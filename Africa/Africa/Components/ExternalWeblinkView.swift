//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 21/08/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    var link: String
    var linkLabel: String
    
    var body: some View {
        Link(destination: (URL(string: link) ?? URL(string: "https://wikipedia.org"))!) {
            GroupBox {
                HStack {
                    Image(systemName: "globe")
                    Text("Wikipedia")
                    
                    Spacer()
                    
                    Group {
                        Image(systemName: "arrow.up.right.circle")
                        Text(linkLabel)
                    }
                    .foregroundColor(.accentColor)
                }
            }
        }
        .buttonStyle(.plain) // disable link color to wikipedia image and text
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalWeblinkView(
            link: "https://wikipedia.org/Lion",
            linkLabel: "Lion"
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
