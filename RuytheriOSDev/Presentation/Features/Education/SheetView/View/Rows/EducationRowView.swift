//
//  EducationRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-13.
//

import SwiftUI

struct EducationRowView: View {
    var rowList: [EducationSheetViewModel.EducationRow]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(rowList.enumerated()), id: \.element) { _, data in
                Text(data.title)
                    .font(NunitoFont.bold.size(18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(AssetColor.blackLabels.color)
                    .padding(.bottom, 5)

                ForEach(Array(data.bulletPoints.enumerated()), id: \.element) { _, title in
                    getRowItemView(title)
                }
            }
        }
        .padding([.leading, .trailing], 24)
        .padding(.bottom)
    }

    func getRowItemView(_ title: String) -> some View {
        HStack {
            Circle()
                .frame(width: 5, height: 5)
                .foregroundStyle(AssetColor.blackLabels.color)
            Text(title)
                .font(NunitoFont.semiBold.size(12))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.grayLabels.color)
        }
    }
}

#Preview {
    EducationRowView(rowList: [
        EducationSheetViewModel.EducationRow(title: "Item1", bulletPoints: ["Bullet 1", "Bullet 2"])
    ])
}
