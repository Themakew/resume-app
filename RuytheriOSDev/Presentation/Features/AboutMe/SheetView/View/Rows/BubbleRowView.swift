//
//  BubbleRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-07.
//

import SwiftUI

struct BubbleRowView: View {
    var bubleData: AboutMeSheetViewModel.BubbleData

    var body: some View {
        VStack(spacing: 4) {
            Text(bubleData.title)
                .font(NunitoFont.black.size(15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
                .padding([.leading, .trailing], 16)
                .foregroundStyle(AssetColor.blackSecondary.color)

            ZStack() {
                Rectangle()
                    .frame(height: 100)
                    .cornerRadius(20.0)
                    .foregroundStyle(AssetColor.whiteBackground.color)

                Text(bubleData.description)
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
    BubbleRowView(bubleData: AboutMeSheetViewModel.BubbleData(title: "Title", description: "description"))
}
