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
                ZStack(alignment: .topLeading) {
                    HStack(spacing: 0) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Button(action: {
                                viewModel.activeTab = tab
                            }) {
                                VStack() {
                                    Spacer()
                                    Image(tab.iconTitle)
                                        .renderingMode(.template)
                                        .foregroundColor(viewModel.activeTab == tab ? AssetColor.orangeIcon.color : .black)
                                        .frame(width: 20, height: 20)

                                    Text(tab.title)
                                        .font(NunitoFont.regular.size(11))
                                        .foregroundColor(viewModel.activeTab == tab ? AssetColor.orangeIcon.color : .black)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .contentShape(.rect)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: highlightLineWidth(geometry: geometry), height: 2)
                        .offset(x: highlightLineOffset(geometry: geometry), y: 0)
                        .animation(.easeInOut(duration: 0.25), value: viewModel.activeTab)
                        .contentShape(.rect)
                }
            }
        }
        .background(Color(.systemBackground))
        .frame(height: 50)
    }

    // Calculate the width of each tab
    private func tabWidth(geometry: GeometryProxy) -> CGFloat {
        let tabCount = CGFloat(Tab.allCases.count)
        return geometry.size.width / tabCount
    }

    // Calculate a smaller width for the highlight line
    private func highlightLineWidth(geometry: GeometryProxy) -> CGFloat {
        return tabWidth(geometry: geometry) * 0.7 // 50% of the tab width
    }

    // Calculate the offset to center the highlight line
    private func highlightLineOffset(geometry: GeometryProxy) -> CGFloat {
        let selectedIndex = CGFloat(Tab.allCases.firstIndex(of: viewModel.activeTab) ?? 0)
        let tabWidth = self.tabWidth(geometry: geometry)
        let lineHalfWidth = self.highlightLineWidth(geometry: geometry) / 2
        return selectedIndex * tabWidth + (tabWidth / 2 - lineHalfWidth)
    }
}

#Preview {
    CustomTabView(viewModel: .constant(BaseTabViewModel()))
}