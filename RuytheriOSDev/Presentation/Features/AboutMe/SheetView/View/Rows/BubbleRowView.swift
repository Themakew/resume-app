//
//  BubbleRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-07.
//

import SwiftUI

struct BubbleRowView: View {
    var bubbleData: AboutMeSheetViewModel.BubbleData

    var body: some View {
        VStack(spacing: 4) {
            Text(bubbleData.title)
                .font(NunitoFont.black.size(15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
                .padding([.leading, .trailing], 16)
                .foregroundStyle(AssetColor.blackSecondary.color)

            ZStack() {
                Rectangle()
                    .frame(height: bubbleData.expandedBuble ? 130 : 100)
                    .cornerRadius(15)
                    .foregroundStyle(AssetColor.whiteBackground.color)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)

                Text(bubbleData.description)
                    .font(NunitoFont.regular.size(14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundStyle(AssetColor.blackLabels.color)
            }
            .padding(.top, 4)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.bottom, 16)
        }
    }
}

#Preview {
    BubbleRowView(bubbleData: AboutMeSheetViewModel.BubbleData(title: "Title", description: "description", expandedBuble: false))
        .background(.cyan)
}
