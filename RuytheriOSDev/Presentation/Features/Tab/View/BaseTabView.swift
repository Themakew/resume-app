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
    @State var sheetYOffsetValue: CGFloat = 141

    @State var bottomBubbleAnimated: Bool = false
    @State var middleBubbleAnimated: Bool = false
    @State var topBubbleAnimated: Bool = false

    @Environment(SceneDelegate.self) private var sceneDelegate

    // MARK: - Private Property

    private let maximumSheetYOffsetValue: CGFloat = 140

    // AboutMe ViewModels
    private let aboutMeSheetViewModel = AboutMeSheetViewModel()
    private let aboutMeTabViewModel = AboutMeBaseViewModel()

    // CareerGoals ViewModels
    private let careerGoalsSheetViewModel = CareerGoalsSheetViewModel()
    private let careerGoalsTabViewModel = CareerGoalsBaseViewModel()

    // Education ViewModels
    private let educationSheetViewModel = EducationSheetViewModel()
    private let educationBaseViewModel = EducationBaseViewModel()

    // Experience ViewModels
    private let experienceSheetViewModel = ExperienceSheetViewModel()
    private let experienceBaseViewModel = ExperienceBaseViewModel()

    // Passion ViewModels
    private let passionSheetViewModel = PassionSheetViewModel()
    private let passionBaseViewModel = PassionBaseViewModel()

    // MARK: - SwiftUI Body

    var body: some View {
        TabView(selection: $viewModel.activeTab) {
            TabBackgroundView(
                viewModel: aboutMeTabViewModel,
                sheetYOffsetValue: $sheetYOffsetValue, 
                maximumSheetYOffsetValue: maximumSheetYOffsetValue
            )
            .hideNativeTabBar()

            TabBackgroundView(
                viewModel: careerGoalsTabViewModel,
                sheetYOffsetValue: $sheetYOffsetValue,
                maximumSheetYOffsetValue: maximumSheetYOffsetValue
            )
            .hideNativeTabBar()

            TabBackgroundView(
                viewModel: educationBaseViewModel,
                sheetYOffsetValue: $sheetYOffsetValue,
                maximumSheetYOffsetValue: maximumSheetYOffsetValue
            )
            .hideNativeTabBar()

            TabBackgroundView(
                viewModel: experienceBaseViewModel,
                sheetYOffsetValue: $sheetYOffsetValue,
                maximumSheetYOffsetValue: maximumSheetYOffsetValue
            )
            .hideNativeTabBar()

            TabBackgroundView(
                viewModel: passionBaseViewModel,
                sheetYOffsetValue: $sheetYOffsetValue,
                maximumSheetYOffsetValue: maximumSheetYOffsetValue
            )
            .hideNativeTabBar()
        }
        .tabSheet(sheetYOffsetValue: $sheetYOffsetValue, selectedDetent: $viewModel.selectedDetent) {
            sheetView
        }
        .onAppear {
            setupTabWindow()
        }
        .onChange(of: viewModel.activeTab) { _, _ in
            viewModel.updateSheetDetentStatus()
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
    private var isToAnimateBinding: Binding<Bool> {
        Binding(
            get: { self.sheetYOffsetValue < self.maximumSheetYOffsetValue },
            set: { _ in }
        )
    }

    private var sheetView: some View {
        NavigationStack {
            VStack(spacing: 15) {
                switch viewModel.activeTab {
                case .aboutMe:
                    ScrollView {
                        AboutMeSheetView(viewModel: aboutMeSheetViewModel)
                    }
                    .padding(.bottom, 50)
                case .careerGoals:
                    ScrollView {
                        CareerGoalsSheetView(
                            isToAnimate: isToAnimateBinding,
                            viewModel: careerGoalsSheetViewModel,
                            bottomBubbleAnimated: $bottomBubbleAnimated,
                            middleBubbleAnimated: $middleBubbleAnimated,
                            topBubbleAnimated: $topBubbleAnimated
                        )
                    }
                    .padding(.bottom, 50)
                case .education:
                    ScrollView {
                        EducationSheetView(viewModel: educationSheetViewModel)
                    }
                    .padding(.bottom, 50)
                case .experience:
                    ScrollView {
                        ExperienceSheetView(viewModel: experienceSheetViewModel)
                    }
                    .padding(.bottom, 50)
                case .passions:
                    ScrollView {
                        PassionSheetView(viewModel: passionSheetViewModel)
                    }
                    .padding(.bottom, 50)
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
            .animation(sheetYOffsetValue > maximumSheetYOffsetValue ? nil : .easeInOut , value: sheetYOffsetValue > maximumSheetYOffsetValue)
        }
    }
}
