//
//  View+Extension.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hideNativeTabBar() -> some View {
        self.toolbar(.hidden, for: .tabBar)
    }
}
