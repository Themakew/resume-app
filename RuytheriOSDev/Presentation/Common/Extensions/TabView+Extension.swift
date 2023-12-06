//
//  TabView+Extension.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

extension TabView {
    @ViewBuilder
    func tabSheet<SheetContent: View>(
        sheetYOffsetValue: Binding<CGFloat>,
        initialHeight: CGFloat = 100,
        sheetCornerRadius: CGFloat = 20,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        self.modifier(BottomSheetModifier(
            sheetYOffsetValue: sheetYOffsetValue,
            initialHeight: initialHeight,
            sheetCornerRadius: sheetCornerRadius,
            sheetView: content())
        )
    }
}

fileprivate struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    @Binding var sheetYOffsetValue: CGFloat

    @State private var showSheet = true

    var initialHeight: CGFloat
    var sheetCornerRadius: CGFloat
    var sheetView: SheetContent

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showSheet, content: {
                GeometryReader { geometry in
                    VStack {
                        sheetView
                            .onChange(of: geometry.frame(in: .global).minY) { _, newValue in
                                sheetYOffsetValue = newValue
                            }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
                .presentationDetents([.height(initialHeight), .fraction(0.99)])
                .presentationCornerRadius(sheetCornerRadius)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .presentationBackground(.regularMaterial)
                .interactiveDismissDisabled()
            })
    }
}
