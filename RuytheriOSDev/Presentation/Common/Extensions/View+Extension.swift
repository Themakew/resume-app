//
//  View+Extension.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

enum DeviceType {
    case iphoneSE
    case iphoneMidSize
    case iphoneMax
    case other
}

extension View {
    @ViewBuilder
    func hideNativeTabBar() -> some View {
        self.toolbar(.hidden, for: .tabBar)
    }

    func getDeviceType() -> DeviceType {
        let screenSize = UIScreen.main.bounds.size
        let screenHeight = max(screenSize.width, screenSize.height)

        switch screenHeight {
        case 667:
            return .iphoneSE
        case 812, 852, 896:
            return .iphoneMidSize
        case 932, 844, 780:
            return .iphoneMax
        default:
            return .other
        }
    }
}
