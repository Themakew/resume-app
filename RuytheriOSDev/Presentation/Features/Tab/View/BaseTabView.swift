//
//  BaseTabView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct BaseTabView: View {
    @State var viewModel: BaseTabViewModel
    @State var sheetYOffsetValue: CGFloat = 0

    @Environment(SceneDelegate.self) private var sceneDelegate

    private let maximumSheetYOffsetValue: CGFloat = 130

    var body: some View {
        TabView(selection: $viewModel.activeTab) {
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
                                title: viewModel.customToolbarTitle,
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

            NavigationStack {
                Text(Tab.careerGoals.title)
            }
            .tag(Tab.careerGoals)
            .hideNativeTabBar()

            NavigationStack {
                Text(Tab.education.title)
            }
            .tag(Tab.education)
            .hideNativeTabBar()

            NavigationStack {
                Text(Tab.experience.title)
            }
            .tag(Tab.experience)
            .hideNativeTabBar()

            NavigationStack {
                Text(Tab.passions.title)
            }
            .tag(Tab.passions)
            .hideNativeTabBar()
        }
        .tabSheet(sheetYOffsetValue: $sheetYOffsetValue) {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 15) {
                        switch viewModel.activeTab {
                        case .aboutMe:
                            deviceRowView("iphone", "iJustine's iPhone", "Home") // Just to test
                        case .careerGoals:
                            deviceRowView("iphone", "iJustine's iPhone", "Home") // Just to test
                        case .education:
                            deviceRowView("iphone", "iJustine's iPhone", "Home") // Just to test
                        case .experience:
                            deviceRowView("iphone", "iJustine's iPhone", "Home") // Just to test
                        case .passions:
                            deviceRowView("iphone", "iJustine's iPhone", "Home") // Just to test
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                }
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(viewModel.activeTab.backgroundViewTitle)
                            .foregroundStyle(AssetColor.blackSecondary.color)
                            .font(NunitoFont.black.size(20))
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        ToolbarCustomButton(title: viewModel.customToolbarTitle) {

                        }
                        .opacity(sheetYOffsetValue > maximumSheetYOffsetValue ? 0 : 1)
                        .animation(.easeInOut, value: sheetYOffsetValue)
                    }
                })
            }
        }
        .onAppear {
            guard sceneDelegate.tabWindow == nil else {
                return
            }

            sceneDelegate.addTabView($viewModel)
        }
    }

    @ViewBuilder
    func deviceRowView(_ image: String, _ title: String, _ subtitle: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: image)
                .font(.title2)
                .background(.background, in: .circle)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.bold)

                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("0 km")
                .font(.callout)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    BaseTabView(viewModel: BaseTabViewModel())
}
