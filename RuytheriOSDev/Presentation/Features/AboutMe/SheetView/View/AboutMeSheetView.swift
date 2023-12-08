//
//  AboutMeSheetView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-06.
//

import SwiftUI

struct AboutMeSheetView<ViewModel: AboutMeSheetViewModelProtocol>: View {
    @State var viewModel: ViewModel

    enum Test {
        case test1(String)
    }

    let arrayTest: [Test] = [.test1("")]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(viewModel.screenData.enumerated()), id: \.element) { index, item in
                switch item {
                case let .bubble(bubbleData):
                    BubbleRowView(bubleData: bubbleData)
                case let .language(languageList):
                    LanguageRowView(languageData: languageList)
                case .description(let description):
                    Text(description.title)
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
        .background(.cyan)
}
