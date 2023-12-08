//
//  BaseTabView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct BaseTabView: View {
    // MARK: - SwiftUI Binders

    @State var viewModel: BaseTabViewModel
    @State var sheetYOffsetValue: CGFloat = 0

    @Environment(SceneDelegate.self) private var sceneDelegate

    // MARK: - Private Property

    private let maximumSheetYOffsetValue: CGFloat = 130

    // AboutMe ViewModels
    private let aboutMeSheetViewModel = AboutMeSheetViewModel()
    private let aboutMeTabViewModel = AboutMeBaseViewModel()

    // MARK: - SwiftUI Body

    var body: some View {
        TabView(selection: $viewModel.activeTab) {
            AboutMeBaseView(
                viewModel: aboutMeTabViewModel,
                sheetYOffsetValue: $sheetYOffsetValue, 
                maximumSheetYOffsetValue: maximumSheetYOffsetValue
            )

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
            sheetView
        }
        .onAppear {
            setupTabWindow()
        }
    }

    // MARK: - Private Method

    private func setupTabWindow() {
        guard sceneDelegate.tabWindow == nil else { return }
        sceneDelegate.addTabView($viewModel)
    }
}

// MARK: - ViewBuilder Extension

extension BaseTabView {
    @ViewBuilder
    private var sheetView: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 15) {
                    switch viewModel.activeTab {
                    case .aboutMe:
                        AboutMeSheetView(viewModel: aboutMeSheetViewModel)
                    case .careerGoals:
                        Text("careerGoals") // TODO
                    case .education:
                        Text("education") // TODO
                    case .experience:
                        Text("experience") // TODO
                    case .passions:
                        Text("passions") // TODO
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollContentBackground(.hidden)
            .toolbar {
                topBarToolbar
            }
        }
    }
}

// MARK: - ToolbarContentBuilder Extension

extension BaseTabView {
    @ToolbarContentBuilder
    private var topBarToolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text(viewModel.activeTab.backgroundViewTitle)
                .foregroundStyle(AssetColor.blackSecondary.color)
                .font(NunitoFont.black.size(20))
        }

        ToolbarItem(placement: .topBarTrailing) {
            ToolbarCustomButton(title: viewModel.customToolbarTitle) {
                // TODO
            }
            .opacity(sheetYOffsetValue > maximumSheetYOffsetValue ? 0 : 1)
            .animation(.easeInOut, value: sheetYOffsetValue)
        }
    }
}
