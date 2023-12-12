//
//  TabBackgroundView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

protocol TabBackgroundViewModelProtocol {
    var viewTitleText: String { get }
    var firstTitleText: String { get }
    var secondTitleText: String { get }
    var backgroundPhotoName: String { get }
    var tabType: Tab { get }

    func hireMeAction()
}

struct TabBackgroundView<ViewModel: TabBackgroundViewModelProtocol>: View {
    @State var viewModel: ViewModel
    @State private var isAnimationPerformed = false

    @State private var helloOpacity: Double = 0
    @State private var helloOffset: CGFloat = 0

    @State private var nameOpacity: Double = 0
    @State private var nameOffset: CGFloat = 0

    @Binding var sheetYOffsetValue: CGFloat

    let maximumSheetYOffsetValue: CGFloat

    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    Image(viewModel.backgroundPhotoName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .ignoresSafeArea()
                }

                VStack {
                    topView
                    Spacer()
                    labelsView
                }
            }
        }
        .tag(viewModel.tabType)
    }

    @ViewBuilder
    private var topView: some View {
        HStack {
            Spacer()
            ToolbarCustomButton(
                title: viewModel.viewTitleText,
                backgroundColor: AssetColor.whiteBackground.color,
                foregroundColor: AssetColor.orangeTitle.color
            ) {
                // TODO
            }
            .opacity(sheetYOffsetValue < maximumSheetYOffsetValue ? 0 : 1)
            .animation(.easeInOut, value: sheetYOffsetValue)
        }
        .padding()
    }

    @ViewBuilder
    private var labelsView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.firstTitleText)
                    .font(NunitoFont.black.size(60))
                    .opacity(helloOpacity)
                    .offset(x: helloOffset)
                    .foregroundStyle(.white)
                    .onAppear {
                        if !isAnimationPerformed {
                            withAnimation(.linear(duration: 0.75)) {
                                helloOpacity = 1
                                helloOffset += 15
                            }
                        }
                    }
                Spacer()
            }

            HStack {
                Text(viewModel.secondTitleText)
                    .font(NunitoFont.black.size(60))
                    .opacity(nameOpacity)
                    .offset(x: nameOffset)
                    .foregroundStyle(.white)
                    .onAppear {
                        if !isAnimationPerformed {
                            withAnimation(.linear(duration: 0.75).delay(0.75)) {
                                nameOpacity = 1
                                nameOffset += 15
                            }

                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75 + 0.75) {
                                isAnimationPerformed = true
                            }
                        }
                    }
                Spacer()
            }
        }
        .padding(.bottom, 120)
    }
}
