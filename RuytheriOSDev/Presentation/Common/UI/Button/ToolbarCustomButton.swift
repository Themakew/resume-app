//
//  ToolbarCustomButton.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct ToolbarCustomButton: View {
    @State private var scale: CGFloat = 1.0
    @Binding var menuItems: [ContactUseCase.MenuItem]

    var title: String = ""
    var backgroundColor: Color = AssetColor.orangeButton.color
    var foregroundColor: Color = .white
    var fontName: String = NunitoFont.black.rawValue
    var fontSize: CGFloat = 18

    var body: some View {
        Menu {
            ForEach(menuItems) { item in
                if let subMenuItems = item.subMenuItems {
                    Menu {
                        ForEach(subMenuItems) { subItem in
                            Button(subItem.title) {
                                subItem.action?(subItem.actionType ?? .none)
                            }
                        }
                    } label: {
                        Image(item.icon ?? "")
                            .renderingMode(.template)
                            .foregroundColor(AssetColor.blackLabels.color)
                        Text(item.title)
                            .font(NunitoFont.semiBold.size(11))
                            .foregroundColor(AssetColor.blackLabels.color)
                    }
                } else {
                    if let url = item.link {
                        Link(item.title, destination: url)
                    }
                }
            }
        } label: {
            Text(title)
                .font(.custom(fontName, size: fontSize))
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(25)
        }
        .scaleEffect(scale)
    }
}

#Preview {
    ToolbarCustomButton(menuItems: .constant([ContactUseCase.MenuItem(title: "Copy Email", icon: "callRinging")]), backgroundColor: .red)
}
