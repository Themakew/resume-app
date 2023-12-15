//
//  BubbleBackgroundView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-15.
//

import SwiftUI

struct BubbleBackgroundView: View {
    var body: some View {
        Rectangle()
            .cornerRadius(15)
            .foregroundStyle(AssetColor.whiteBackground.color)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
    }
}

#Preview {
    BubbleBackgroundView()
}
