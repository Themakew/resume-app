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
    var hireContextMenuItem = [ContactUseCase.MenuItem]()

    private let contactUseCase: ContactUseCaseProtocol

    init(contactUseCase: ContactUseCaseProtocol) {
        self.contactUseCase = contactUseCase
    }

    func fetchData() {
        hireContextMenuItem = contactUseCase.fetchData()
    }
}
