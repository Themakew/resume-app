//
//  SkillSectionRow.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-13.
//

import SwiftUI

struct SkillSectionRow: View {
    var rowList: [EducationSheetViewModel.Skill]

    var body: some View {
        VStack {
            ForEach(Array(rowList.enumerated()), id: \.element) { _, data in
                getRowItemView(data)
            }
        }
        .background {
            Rectangle()
                .cornerRadius(15)
                .foregroundStyle(AssetColor.whiteBackground.color)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                .padding([.top, .bottom], -16)
        }
        .padding([.leading, .trailing])
    }

    func getRowItemView(_ data: EducationSheetViewModel.Skill) -> some View {
        HStack(spacing: 20) {
            HStack {
                Text(data.title)
                    .font(NunitoFont.bold.size(18))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundStyle(AssetColor.blackLabels.color)
            }

            HStack {
                Image(data.skillLevel.rawValue)
                Spacer()
            }
        }
    }
}

#Preview {
    SkillSectionRow(rowList: [
        EducationSheetViewModel.Skill(title: "Skill1", skillLevel: .basic),
        EducationSheetViewModel.Skill(title: "Skill2", skillLevel: .intermediate),
        EducationSheetViewModel.Skill(title: "Skill3", skillLevel: .advanced)
    ])
}
