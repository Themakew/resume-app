//
//  TabView+Extension.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

extension TabView {
    @ViewBuilder
    func tabSheet<SheetContent: View>(initialHeight: CGFloat = 100, sheetCornerRadius: CGFloat = 20, @ViewBuilder content: @escaping () -> SheetContent) -> some View {
        self.modifier(BottomSheetModifier(initialHeight: initialHeight, sheetCornerRadius: sheetCornerRadius, sheetView: content()))
    }
}

fileprivate struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    @State private var showSheet = true

    var initialHeight: CGFloat
    var sheetCornerRadius: CGFloat
    var sheetView: SheetContent

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showSheet, content: {
                sheetView
                    .presentationDetents([.height(initialHeight), .fraction(0.99)])
                    .presentationCornerRadius(sheetCornerRadius)
                    .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                    .presentationBackground(.regularMaterial)
                    .interactiveDismissDisabled()
            })

    }
}
