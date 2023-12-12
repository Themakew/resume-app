//
//  LocationRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-08.
//

import SwiftUI

struct LocationRowView: View {
    var locationData: AboutMeSheetViewModel.LocationData

    var body: some View {
        VStack(spacing: 4) {
            Text(locationData.title)
                .font(NunitoFont.black.size(15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
                .padding([.leading, .trailing], 16)
                .foregroundStyle(AssetColor.blackSecondary.color)

            ZStack() {
                Rectangle()
                    .frame(height: 55)
                    .cornerRadius(15)
                    .foregroundStyle(AssetColor.whiteBackground.color)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)

                HStack(spacing: 0) {
                    Image("map")
                        .renderingMode(.template)
                        .foregroundStyle(AssetColor.blackLabels.color)

                    Text(locationData.location)
                        .font(NunitoFont.regular.size(14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundStyle(AssetColor.blackLabels.color)
                }
                .padding([.leading, .trailing], 16)
            }
            .padding(.top, 4)
            .padding([.leading, .trailing, .bottom], 16)
        }
    }
}

#Preview {
    LocationRowView(locationData: AboutMeSheetViewModel.LocationData(title: "title", location: "location"))
}
