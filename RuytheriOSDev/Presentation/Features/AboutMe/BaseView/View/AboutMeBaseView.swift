//
//  AboutMeBaseView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct AboutMeBaseView<ViewModel: AboutMeBaseViewModelProtocol>: View {
    @State var viewModel: ViewModel

    @Binding var sheetYOffsetValue: CGFloat

    let maximumSheetYOffsetValue: CGFloat

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                Image("picture")
                    .resizable() // This makes the image resizable
                    .scaledToFill() // This is similar to UIKit's .scaleAspectFill
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped() // This ensures the image does not exceed its frame
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()
                        ToolbarCustomButton(
                            title: viewModel.viewTitle,
                            backgroundColor: .white,
                            foregroundColor: AssetColor.orangeTitle.color
                        ) {

                        }
                        .opacity(sheetYOffsetValue < maximumSheetYOffsetValue ? 0 : 1)
                        .animation(.easeInOut, value: sheetYOffsetValue)
                    }
                    .padding()
                    Spacer()
                }
            }
        }
        .tag(Tab.aboutMe)
        .hideNativeTabBar()   
    }
}
