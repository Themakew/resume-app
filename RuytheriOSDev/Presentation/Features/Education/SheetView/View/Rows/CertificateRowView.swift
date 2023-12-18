//
//  CertificateRowView.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-13.
//

import SwiftUI

struct CertificateRowView: View {
    var rowList: [EducationSheetViewModel.CertificateRow]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(rowList) { data in
                getRowItemView(data)
                    .padding(.bottom)
            }
        }
        .padding([.leading, .trailing], 24)
    }

    func getRowItemView(_ data: EducationSheetViewModel.CertificateRow) -> some View {
        VStack(spacing: 0) {
            Text(data.title)
                .font(NunitoFont.bold.size(18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.blackLabels.color)
                .underline()

            Text(data.location)
                .font(NunitoFont.semiBold.size(14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.grayLabels.color)

            Text(data.date)
                .font(NunitoFont.medium.size(12))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(AssetColor.grayLabels.color)
        }
    }
}

#Preview {
    CertificateRowView(rowList: [
        EducationSheetViewModel.CertificateRow(title: "Title1", location: "Location", date: "Date"),
        EducationSheetViewModel.CertificateRow(title: "Title2", location: "Location", date: "Date")
    ])
}
