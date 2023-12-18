//
//  LanguageRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-07.
//

import SwiftUI

struct LanguageRowView: View {
    var languageData: AboutMeSheetViewModel.LanguageData

    var body: some View {
        VStack(spacing: 4) {
            Text(languageData.title)
                .font(NunitoFont.black.size(15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
                .padding([.leading, .trailing], 16)
                .foregroundStyle(AssetColor.blackSecondary.color)

            ZStack {
                Rectangle()
                    .frame(height: 130)
                    .cornerRadius(15)
                    .foregroundStyle(AssetColor.whiteBackground.color)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)

                VStack(spacing: 24) {
                    getLanguageDetailRowView(title: languageData.firstLanguageTitle, progressRange: languageData.firstLanguageValue)
                    getLanguageDetailRowView(title: languageData.secondLanguageTitle, progressRange: languageData.secondLanguageValue)
                }
                .padding()
            }
            .padding(.top, 4)
            .padding([.leading, .trailing, .bottom], 16)
        }
    }

    private func getLanguageDetailRowView(title: String, progressRange: Double) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(NunitoFont.semiBold.size(14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.blackSecondary.color)

            getCustomProgressView(progressRange: progressRange)
        }
    }

    private func getCustomProgressView(progressRange: Double) -> some View {
        ZStack {
            Capsule()
                .frame(height: 10)
                .foregroundStyle(AssetColor.blackSecondary.color)
                .opacity(0.1)


            GeometryReader { geometry in
                Rectangle()
                    .fill(LinearGradient(gradient: AssetColor.gradient.gradientColors, startPoint: .leading, endPoint: .trailing))
                    .frame(width: geometry.size.width * progressRange, height: 6)
                    .cornerRadius(3)
            }
            .frame(height: 6)
            .padding(.leading, 2)
            .padding(.trailing, 2)
        }
    }
}

#Preview {
    LanguageRowView(languageData: AboutMeSheetViewModel.LanguageData(
        title: "title",
        firstLanguageTitle: "firstLanguageTitle",
        firstLanguageValue: 0.9,
        secondLanguageTitle: "secondLanguageTitle",
        secondLanguageValue: 1.0
    ))
}
