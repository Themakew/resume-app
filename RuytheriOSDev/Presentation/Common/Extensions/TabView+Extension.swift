//
//  TabView+Extension.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

extension TabView {
    func tabSheet<SheetContent: View>(
        sheetYOffsetValue: Binding<CGFloat>,
        selectedDetent: Binding<PresentationDetent>,
        initialHeight: CGFloat = 110,
        sheetCornerRadius: CGFloat = 20,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        self.modifier(
            BottomSheetModifier(
                sheetYOffsetValue: sheetYOffsetValue,
                selectedDetent: selectedDetent,
                initialHeight: initialHeight,
                sheetCornerRadius: sheetCornerRadius,
                sheetView: content()
            )
        )
    }
}

fileprivate struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    @Binding var sheetYOffsetValue: CGFloat
    @Binding var selectedDetent: PresentationDetent

    @State private var showSheet = true

    private let gradient = LinearGradient (
        gradient: Gradient(colors: [
            AssetColor.firstGradientColor.color,
            AssetColor.secondGradientColor.color
        ]),
        startPoint: .top,
        endPoint: .bottom
    )

    var initialHeight: CGFloat
    var sheetCornerRadius: CGFloat
    var sheetView: SheetContent

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showSheet, content: {
                GeometryReader { geometry in
                    sheetView
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .onChange(of: geometry.frame(in: .global).minY) { _, newValue in
                            sheetYOffsetValue = newValue
                        }
                }
                .presentationDetents([.height(initialHeight), .fraction(0.99)], selection: $selectedDetent)
                .presentationCornerRadius(sheetCornerRadius)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .presentationBackground(content: {
                    backgroundGradient
                })
                .interactiveDismissDisabled()
            })
    }

    private var backgroundGradient: some View {
        Rectangle()
            .fill(gradient)
            .edgesIgnoringSafeArea(.all)
    }
}
