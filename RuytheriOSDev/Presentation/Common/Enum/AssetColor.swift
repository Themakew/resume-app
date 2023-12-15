//
//  AssetColor.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

enum AssetColor: String {
    case blackLabels = "BlackLabels"
    case blackSecondary = "BlackSecondary"
    case grayLabels = "GrayLabels"
    case orangeButton = "OrangeButton"
    case orangeIcon = "OrangeIcon"
    case orangeTitle = "OrangeTitle"
    case whiteBackground = "WhiteBackground"
    case firstGradientColor = "FirstGradientColor"
    case secondGradientColor = "SecondGradientColor"
    case gradient

    var color: Color {
        Color(self.rawValue)
    }

    var gradientColors: Gradient {
        Gradient(colors: [
            Color(red: 0.61, green: 0.17, blue: 0.47, opacity: 0.7),
            Color(red: 0.8, green: 0.06, blue: 0.3, opacity: 0.8),
            Color(red: 0.88, green: 0.3, blue: 0.16, opacity: 0.8),
            Color(red: 0.99, green: 0.52, blue: 0.12, opacity: 0.8)
        ])
    }
}
