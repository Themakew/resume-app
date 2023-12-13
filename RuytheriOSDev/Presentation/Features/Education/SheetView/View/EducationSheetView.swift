//
//  EducationSheetView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-13.
//

import SwiftUI

struct EducationSheetView<ViewModel: EducationSheetViewModelProtocol>: View {
    @State var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(viewModel.screenData.enumerated()), id: \.element) { _, section in
                switch section {
                case let .educationSection(data):
                    VStack(spacing: 0) {
                        SectionView(imageName: data.imageName, titleText: data.title)
                        EducationRowView(rowList: data.sectionRows)
                    }
                case let .certificateSection(data):
                    VStack(spacing: 0) {
                        SectionView(imageName: data.imageName, titleText: data.title)
                        CertificateRowView(rowList: data.sectionRows)
                    }
                case let .skillSection(data):
                    VStack(spacing: 16) {
                        SectionView(titleText: data.title)
                        SkillSectionRow(rowList: data.skillList)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
        .padding(.bottom, 24)
    }
}

#Preview {
    EducationSheetView(viewModel: EducationSheetViewModel())
}
