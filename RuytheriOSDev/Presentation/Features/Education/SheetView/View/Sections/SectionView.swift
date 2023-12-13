//
//  SectionWithIconView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-13.
//

import SwiftUI

struct SectionView: View {
    var imageName: String?
    var titleText: String

    var body: some View {
        HStack {
            if let imageName {
                Image(imageName)
                    .frame(width: 40, height: 40)
            }

            Text(titleText)
                .font(NunitoFont.black.size(18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.blackSecondary.color)
        }
        .padding()
    }
}

#Preview {
    SectionView(imageName: "education", titleText: "My Education")
}
