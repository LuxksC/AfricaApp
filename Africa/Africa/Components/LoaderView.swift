//
//  LoaderView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 14/08/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ProgressView() {
                Text("Loading ...")
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .padding(.top, 16)
            }
            .progressViewStyle(.circular)
            .tint(.accentColor)
            .controlSize(.large)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
