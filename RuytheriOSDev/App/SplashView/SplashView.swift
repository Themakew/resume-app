//
//  SplashView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-19.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimationDone = false
    @State private var avatarOpacity = 0.0
    @State private var avatarScale: CGFloat = 1.2
    @State private var labelOpacity = 0.0
    @State private var labelOffsetY: CGFloat = -40
    @State private var startGradient = UnitPoint(x: 0, y: -1)
    @State private var endGradient = UnitPoint(x: 1, y: 0)

    private let animationDurationValue = 0.7
    private let parentViewModel = BaseTabViewModel(contactUseCase: ContactUseCase())

    private var animatedGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                AssetColor.firstGradientColor.color,
                AssetColor.secondGradientColor.color
            ]),
            startPoint: startGradient,
            endPoint: endGradient
        )
    }

    var body: some View {
        if isAnimationDone {
            BaseTabView(viewModel: parentViewModel)
        } else {
            splashContent
        }
    }

    var splashContent: some View {
        ZStack {
            animatedGradient
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        startGradient = UnitPoint(x: 1, y: 0)
                        endGradient = UnitPoint(x: 0, y: 1)
                    }
                }

            HStack {
                Spacer()

                VStack(spacing: 200) {
                    Spacer()

                    Image("ruyther")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .scaleEffect(avatarScale)
                        .opacity(avatarOpacity)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                avatarOpacity = 1
                                avatarScale = 1.0
                            }
                        }

                    Text("RuytherIOSDev")
                        .font(NunitoFont.black.size(25))
                        .foregroundColor(AssetColor.blackLabels.color)
                        .opacity(labelOpacity)
                        .offset(y: labelOffsetY)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.5).delay(0.75)) {
                                labelOpacity = 1
                                labelOffsetY = 0
                            }
                        }

                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isAnimationDone = true
                    }
                }

                Spacer()
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SplashView()
}
