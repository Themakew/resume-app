//
//  AboutMeBaseViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-06.
//

import SwiftUI

@Observable final class AboutMeBaseViewModel: TabBackgroundViewModelProtocol {
    var viewTitleText = "Hire me"
    var firstTitleText = "Hello,"
    var secondTitleText = "I am Ruyther!"
    var backgroundPhotoName = "picture"
    var tabType: Tab = .aboutMe

    func hireMeAction() {
        // TODO
    }
}
