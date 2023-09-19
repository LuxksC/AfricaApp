//
//  CenterModifier.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 19/09/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
