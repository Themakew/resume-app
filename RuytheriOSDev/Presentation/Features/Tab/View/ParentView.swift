//
//  ParentView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct ParentView: View {
    @State var viewModel: ParentViewModel

    @Environment(SceneDelegate.self) private var sceneDelegate

    var body: some View {
        TabView(selection: $viewModel.activeTab) {
            NavigationStack {
                Text(Tab.aboutMe.title)
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
        .tabSheet {
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
                        Text(viewModel.activeTab.title)
                            .font(.title.bold())
                    }

                    if viewModel.activeTab == .aboutMe {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {}, label: {
                                Image(systemName: "plus")
                            })
                        }
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
    ParentView(viewModel: ParentViewModel())
}
