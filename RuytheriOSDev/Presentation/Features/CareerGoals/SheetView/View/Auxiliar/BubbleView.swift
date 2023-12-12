//
//  BubbleView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-11.
//

import SwiftUI

struct BubbleView: View {
    var charIconName: String
    var charIconOffset: (x: Double, y: Double)
    var text: String
    var alignment: Alignment
    var curveImageName: String
    var curveImageOffset: (x: Double, y: Double)
    var bubbleFrame: (width: CGFloat, height: CGFloat)
    var bubbleOffsetY: CGFloat


    var body: some View {
        ZStack {
            Image(charIconName)
                .offset(x: charIconOffset.x, y: charIconOffset.y)

            bubbleContent
        }
    }

    private var bubbleContent: some View {
        ZStack {
            ZStack(alignment: alignment) {
                Image(curveImageName)
                    .renderingMode(.template)
                    .foregroundColor(AssetColor.whiteBackground.color)
                    .offset(x: curveImageOffset.x, y: curveImageOffset.y)

                Rectangle()
                    .cornerRadius(15)
                    .foregroundStyle(AssetColor.whiteBackground.color)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
            }

            Text(text)
                .font(NunitoFont.regular.size(14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundStyle(AssetColor.blackLabels.color)
        }
        .frame(width: bubbleFrame.width, height: bubbleFrame.height)
        .offset(y: bubbleOffsetY)
    }
}
