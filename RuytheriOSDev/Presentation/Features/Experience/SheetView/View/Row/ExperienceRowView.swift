//
//  ExperienceRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-15.
//

import SwiftUI

struct ExperienceRowView: View {
    var data: ExperienceSheetViewModel.Item

    var body: some View {
        HStack(spacing: 0) {
            getExperienceDetailView()
                .padding([.top, .bottom])
        }
        .background {
            ZStack(alignment: .leading) {
                BubbleBackgroundView()
                getCustomProgressView()
            }
        }
        .padding([.leading, .trailing])
    }

    @ViewBuilder
    private func getCustomProgressView() -> some View {
        HStack(alignment: .center) {
            GeometryReader { geometry in
                Rectangle()
                    .fill(LinearGradient(gradient: AssetColor.gradient.gradientColors, startPoint: .top, endPoint: .bottom))
                    .frame(width: 6, height: geometry.size.height)
                    .cornerRadius(3)
            }
            .padding(.top, 35)
            .padding([.leading, .trailing, .bottom])
            .frame(width: 35)
        }
    }

    @ViewBuilder
    private func getExperienceDetailView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(data.title)
                .font(NunitoFont.bold.size(20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.blackLabels.color)
                .padding(.bottom, 5)

            Text(data.subtitle)
                .font(NunitoFont.bold.size(12))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.blackLabels.color)
                .padding(.bottom, 5)

            VStack(spacing: 5) {
                ForEach(Array(data.bulletPoints.enumerated()), id: \.element) { _, title in
                    getRowItemView(title)
                }
            }
            .padding(.top)
        }
        .padding(.leading, 35)
    }

    @ViewBuilder
    func getRowItemView(_ title: String) -> some View {
        HStack(alignment: .top) {
            Circle()
                .frame(width: 5, height: 5)
                .foregroundStyle(AssetColor.blackLabels.color)
                .padding(.top, 6)
            Text(title)
                .font(NunitoFont.semiBold.size(13))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.grayLabels.color)
                .lineLimit(nil)
        }
        .padding(.trailing)
        .padding(.leading, 10)
    }
}

#Preview {
    ExperienceRowView(data: ExperienceSheetViewModel.Item(title: "Title", subtitle: "Subtitle", bulletPoints: ["Bullet1", "Bullet2"]))
}
