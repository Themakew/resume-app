//
//  AboutMeBaseView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct AboutMeBaseView<ViewModel: AboutMeBaseViewModelProtocol>: View {
    @State var viewModel: ViewModel

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
                    Image("picture")
                        .resizable() // This makes the image resizable
                        .scaledToFill() // This is similar to UIKit's .scaleAspectFill
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped() // This ensures the image does not exceed its frame
                        .ignoresSafeArea()
                }

                VStack {
                    topView
                    Spacer()
                    labelsView
                }
            }
        }
        .tag(Tab.aboutMe)
        .hideNativeTabBar()
    }

    @ViewBuilder
    private var topView: some View {
        HStack {
            Spacer()
            ToolbarCustomButton(
                title: viewModel.viewTitle,
                backgroundColor: .white,
                foregroundColor: AssetColor.orangeTitle.color
            ) {
                // TODO
            }
            .opacity(sheetYOffsetValue < maximumSheetYOffsetValue ? 0 : 1)
            .animation(.easeInOut, value: sheetYOffsetValue)
        }
        .padding()
    }

    private var labelsView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.helloLabel)
                    .font(NunitoFont.black.size(60))
                    .opacity(helloOpacity)
                    .offset(x: helloOffset)
                    .foregroundStyle(.white)
                    .onAppear {
                        withAnimation(.linear(duration: 0.75)) {
                            helloOpacity = 1
                            helloOffset += 15
                        }
                    }
                Spacer()
            }

            HStack {
                Text(viewModel.nameLabel)
                    .font(NunitoFont.black.size(60))
                    .opacity(nameOpacity)
                    .offset(x: nameOffset)
                    .foregroundStyle(.white)
                    .onAppear {
                        withAnimation(.linear(duration: 0.75).delay(0.75)) {
                            nameOpacity = 1
                            nameOffset += 15
                        }
                    }
                Spacer()
            }
        }
        .padding(.bottom, 130)
    }
}
