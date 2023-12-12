//
//  PassionBaseViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-08.
//

import Foundation

@Observable final class PassionBaseViewModel: TabBackgroundViewModelProtocol {
    var viewTitleText = "Hire me"
    var firstTitleText = "My"
    var secondTitleText = "Passions"
    var backgroundPhotoName = "passion"
    var tabType: Tab = .passions

    func hireMeAction() {
        // TODO
    }
}
