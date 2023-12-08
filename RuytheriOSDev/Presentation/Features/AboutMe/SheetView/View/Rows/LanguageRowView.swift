//
//  LanguageRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-07.
//

import SwiftUI

struct LanguageRowView: View {
    var languageData: AboutMeSheetViewModel.LanguageData

    private let gradientColors = Gradient(colors: [
        Color(red: 0.61, green: 0.17, blue: 0.47, opacity: 0.7),
        Color(red: 0.8, green: 0.06, blue: 0.3, opacity: 0.8),
        Color(red: 0.88, green: 0.3, blue: 0.16, opacity: 0.8),
        Color(red: 0.99, green: 0.52, blue: 0.12, opacity: 0.8)
    ])

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
                    .cornerRadius(20.0)
                    .foregroundStyle(AssetColor.whiteBackground.color)

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

    @ViewBuilder
    private func getLanguageDetailRowView(title: String, progressRange: Double) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(NunitoFont.semiBold.size(14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.blackSecondary.color)

            getCustomProgressView(progressRange: progressRange)
        }
    }

    @ViewBuilder
    private func getCustomProgressView(progressRange: Double) -> some View {
        ZStack {
            Capsule()
                .frame(height: 10)
                .foregroundStyle(AssetColor.blackSecondary.color)
                .opacity(0.1)


            GeometryReader { geometry in
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors, startPoint: .leading, endPoint: .trailing))
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
