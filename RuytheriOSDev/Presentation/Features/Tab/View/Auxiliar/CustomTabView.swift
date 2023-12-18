//
//  CustomTabView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var viewModel: BaseTabViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Divider()
                tabBarView(geometry: geometry)
            }
        }
        .background(Color(.systemBackground))
        .frame(height: 50)
    }

    // MARK: - Tab Bar View

    private func tabBarView(geometry: GeometryProxy) -> some View {
        ZStack(alignment: .topLeading) {
            tabBarButtonsView()
            highlightLineView(geometry: geometry)
        }
    }

    // MARK: - Tab Bar Buttons

    private func tabBarButtonsView() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabBarButton(tab: tab, isActive: viewModel.activeTab == tab, action: {
                    viewModel.activeTab = tab
                })
            }
        }
    }

    // MARK: - Highlight Line

    private func highlightLineView(geometry: GeometryProxy) -> some View {
        Rectangle()
            .fill(Color.orange)
            .frame(width: highlightLineWidth(geometry: geometry), height: 2)
            .offset(x: highlightLineOffset(geometry: geometry), y: 0)
            .animation(.easeInOut(duration: 0.25), value: viewModel.activeTab)
    }

    // MARK: - Helper Methods

    private func tabWidth(geometry: GeometryProxy) -> CGFloat {
        let tabCount = CGFloat(Tab.allCases.count)
        return geometry.size.width / tabCount
    }

    private func highlightLineWidth(geometry: GeometryProxy) -> CGFloat {
        return tabWidth(geometry: geometry) * 0.7
    }

    private func highlightLineOffset(geometry: GeometryProxy) -> CGFloat {
        let selectedIndex = CGFloat(Tab.allCases.firstIndex(of: viewModel.activeTab) ?? 0)
        let tabWidth = tabWidth(geometry: geometry)
        let lineHalfWidth = highlightLineWidth(geometry: geometry) / 2
        return selectedIndex * tabWidth + (tabWidth / 2 - lineHalfWidth)
    }
}

#Preview {
    CustomTabView(viewModel: .constant(BaseTabViewModel()))
}
