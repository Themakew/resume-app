//
//  Font.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

enum NunitoFont: String {
    case black = "Nunito-Black"
    case bold = "Nunito-Bold"
    case extraBold = "Nunito-ExtraBold"
    case extraLight = "Nunito-ExtraLight"
    case light = "Nunito-Light"
    case medium = "Nunito-Medium"
    case regular = "Nunito-Regular"
    case semiBold = "Nunito-SemiBold"

    func size(_ size: CGFloat) -> Font {
        Font.custom(self.rawValue, size: size)
    }
}
