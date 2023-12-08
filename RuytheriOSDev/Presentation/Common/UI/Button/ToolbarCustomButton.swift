//
//  ToolbarCustomButton.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct ToolbarCustomButton: View {
    @State private var scale: CGFloat = 1.0

    var title: String = ""
    var backgroundColor: Color = AssetColor.orangeButton.color
    var foregroundColor: Color = .white
    var fontName: String = NunitoFont.black.rawValue
    var fontSize: CGFloat = 18
    var action: () -> Void

    var body: some View {
        Button(action: {
            animate()
            action()
        }) {
            Text(title)
                .font(.custom(fontName, size: fontSize))
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(25)
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(scale)
    }

    private func animate() {
        // Trigger the initial scale down to 0.9
        withAnimation(.spring(response: 0.1, dampingFraction: 0.3, blendDuration: 0)) {
            scale = 0.9
        }

        // Delay the execution of the second animation to scale back to 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0)) {
                scale = 1.0
            }
        }
    }
}

#Preview {
    ToolbarCustomButton() {}
}
