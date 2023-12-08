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

    var color: Color {
        Color(self.rawValue)
    }
}
