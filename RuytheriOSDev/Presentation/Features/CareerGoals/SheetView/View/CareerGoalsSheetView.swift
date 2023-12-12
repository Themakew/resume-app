//
//  CareerGoalsSheetView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-09.
//

import SwiftUI

struct CareerGoalsSheetView<ViewModel: CareerGoalsSheetViewModelProtocol>: View {
    @Binding var isToAnimate: Bool

    @State var viewModel: ViewModel

    @State var bottomBubbleOpacity: Double = 0
    @State var middleBubbleOpacity: Double = 0
    @State var topBubbleOpacity: Double = 0

    @Binding var bottomBubbleAnimated: Bool
    @Binding var middleBubbleAnimated: Bool
    @Binding var topBubbleAnimated: Bool

    var body: some View {
        ZStack {
            backgroundImage
            bubbleViews
        }
        .padding([.top, .bottom], 5)
    }

    private var backgroundImage: some View {
        Image("chart")
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()
    }

    private var scaleFactorTwoToFive: (x: CGFloat, y: CGFloat) {
        switch getDeviceType() {
        case .iphoneSE:
            return (5, -70)
        case .iphoneMidSize, .iphoneMax:
            return (10, -85)
        default:
            return (10, -85)
        }
    }

    private var scaleFactorPlusFive: (x: CGFloat, y: CGFloat) {
        switch getDeviceType() {
        case .iphoneSE:
            return (100, -250)
        default:
            return (110, -280)
        }
    }

    private var bubbleViews: some View {
        Group {
            BubbleView(
                charIconName: "1-2yrs",
                charIconOffset: (x: -140, y: 120),
                text: viewModel.bottomBubbleText,
                alignment: .leading,
                curveImageName: "curveLeft",
                curveImageOffset: (x: getDeviceType() == .iphoneMax ? 20 : 40, y: -65),
                bubbleFrame: (width: 270, height: 130),
                bubbleOffsetY: getDeviceType() == .iphoneSE ? 215 : 230
            )
            .padding([.trailing, .bottom], 16)
            .padding(.leading, 76)
            .opacity(bottomBubbleAnimated ? 1 : bottomBubbleOpacity)
            .onChange(of: isToAnimate, { _, newValue in
                if newValue && !bottomBubbleAnimated {
                    withAnimation(.linear(duration: 0.75).delay(0.75)) {
                        bottomBubbleOpacity = 1
                    }
                }
            })

            BubbleView(
                charIconName: "2-5yrs",
                charIconOffset: (x: scaleFactorTwoToFive.x, y: scaleFactorTwoToFive.y),
                text: viewModel.middleBubbleText,
                alignment: .trailing,
                curveImageName: "curveTop",
                curveImageOffset: (x: -100, y: -70),
                bubbleFrame: (width: 350, height: 128),
                bubbleOffsetY: 30
            )
            .padding([.trailing, .bottom, .leading], 16)
            .opacity(middleBubbleAnimated ? 1 : middleBubbleOpacity)
            .onChange(of: isToAnimate, { _, newValue in
                if newValue && !middleBubbleAnimated {
                    withAnimation(.linear(duration: 0.75).delay((0.75 * 2))) {
                        middleBubbleOpacity = 1
                    }
                }
            })

            BubbleView(
                charIconName: "5yrs+",
                charIconOffset: (x: scaleFactorPlusFive.x, y: scaleFactorPlusFive.y),
                text: viewModel.topBubbleText,
                alignment: .trailing,
                curveImageName: "curveTopRight",
                curveImageOffset: (x: getDeviceType() != .iphoneMax ? -20 : 0, y: -52),
                bubbleFrame: (width: 350, height: 110),
                bubbleOffsetY: getDeviceType() == .iphoneMax ? -190 : -165
            )
            .padding(.trailing, 10)
            .padding([.bottom, .leading], 16)
            .opacity(topBubbleAnimated ? 1 : topBubbleOpacity)
            .onChange(of: isToAnimate, { _, newValue in
                if newValue && !topBubbleAnimated {
                    withAnimation(.linear(duration: 0.75).delay((0.75 * 3))) {
                        topBubbleOpacity = 1
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + (0.75 * 3)) {
                        bottomBubbleAnimated = true
                        middleBubbleAnimated = true
                        topBubbleAnimated = true
                    }
                }
            })
        }
    }
}

//#Preview {
//    CareerGoalsSheetView(isToAnimate: .constant(true), viewModel: CareerGoalsSheetViewModel())
//}
