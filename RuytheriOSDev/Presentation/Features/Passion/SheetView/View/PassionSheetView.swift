//
//  PassionSheetView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-15.
//

import SwiftUI

struct PassionSheetView<ViewModel: PassionSheetViewModelProtocol>: View {
    @State var viewModel: ViewModel

    @AppStorage("shouldDisplayAnimation") var shouldDisplayAnimation: Bool = true

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(viewModel.screenData) { itemData in
                    PassionItemView(data: itemData)
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchData()
        }
        .padding([.top, .bottom], 24)
    }
}

#Preview {
    PassionSheetView(viewModel: PassionSheetViewModel())
}
