//
//  ExperienceSheetView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-15.
//

import SwiftUI

struct ExperienceSheetView<ViewModel: ExperienceSheetViewModelProtocol>: View {
    @State var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 24) {
            ForEach(viewModel.screenData) { itemData in
                ExperienceRowView(data: itemData)
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
        .padding([.top, .bottom], 24)
    }
}

#Preview {
    ExperienceSheetView(viewModel: ExperienceSheetViewModel())
}
