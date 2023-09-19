//
//  CreditsView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 19/09/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        HStack(spacing: 24) {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
                Copyright © Lucas de Castro
                All right reserved
                """
            )
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
