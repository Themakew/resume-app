//
//  PassionItemView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-18.
//

import SwiftUI

struct PassionItemView: View {
    var data: PassionSheetViewModel.Item

    var body: some View {
        let screenSize = UIScreen.main.bounds

        VStack(alignment: .center) {
            Image(data.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: screenSize.width * 0.85, height: screenSize.height * 0.5)
                .cornerRadius(2)
                .clipped()

            Spacer(minLength: 0)

            Text(data.description)
                .font(NunitoFont.bold.size(14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.blackLabels.color)
                .padding(.top, 8)

            Spacer(minLength: 0)

            Text(data.pagination)
                .font(NunitoFont.black.size(12))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(AssetColor.orangeTitle.color)
                .padding([.top, .bottom], 8)

            Spacer(minLength: 0)
        }
        .frame(
            width: screenSize.width * 0.85,
            height: screenSize.height * (getDeviceType() == .iphoneSE ? 0.7 : 0.64)
        )
        .padding(.top)
        .padding([.leading, .trailing], 8)
        .background {
            ZStack(alignment: .leading) {
                BubbleBackgroundView()
            }
        }
    }
}

#Preview {
    PassionItemView(data: PassionSheetViewModel.Item(imageName: "education", description: "description", pagination: "1/1"))
}
