//
//  AboutMeSheetView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-06.
//

import SwiftUI

struct AboutMeSheetView<ViewModel: AboutMeSheetViewModelProtocol>: View {
    @State var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(viewModel.screenData.enumerated()), id: \.element) { _, item in
                switch item {
                case let .bubble(bubbleData):
                    BubbleRowView(bubbleData: bubbleData)
                case let .language(languageList):
                    LanguageRowView(languageData: languageList)
                case let .location(locationData):
                    LocationRowView(locationData: locationData)
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    AboutMeSheetView(viewModel: AboutMeSheetViewModel())
}
