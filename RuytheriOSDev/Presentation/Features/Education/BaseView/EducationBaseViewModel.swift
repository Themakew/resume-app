//
//  EducationBaseViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-08.
//

import SwiftUI

@Observable final class EducationBaseViewModel: TabBackgroundViewModelProtocol {
    var viewTitleText = "Hire me"
    var firstTitleText = "My"
    var secondTitleText = "Education"
    var backgroundPhotoName = "masters"
    var tabType: Tab = .education

    func hireMeAction() {
        // TODO
    }
}
