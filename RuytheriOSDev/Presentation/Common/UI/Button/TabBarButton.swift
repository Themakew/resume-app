//
//  TabBarButton.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-06.
//

import SwiftUI

struct TabBarButton: View {
    let tab: Tab
    let isActive: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack() {
                Spacer()
                Image(tab.iconTitle)
                    .renderingMode(.template)
                    .foregroundColor(isActive ? AssetColor.orangeIcon.color : AssetColor.blackLabels.color)
                    .frame(width: 20, height: 20)

                Text(tab.title)
                    .font(NunitoFont.semiBold.size(11))
                    .foregroundColor(isActive ? AssetColor.orangeIcon.color : AssetColor.blackLabels.color)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(.rect)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TabBarButton(tab: .aboutMe, isActive: false) {}
}
