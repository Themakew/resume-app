//
//  ExperienceBaseViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-08.
//

import Foundation

@Observable final class ExperienceBaseViewModel: TabBackgroundViewModelProtocol {
    var viewTitleText = "Hire me"
    var firstTitleText = "My"
    var secondTitleText = "Experience"
    var backgroundPhotoName = "office"
    var tabType: Tab = .experience
    var hireContextMenuItem = [ContactUseCase.MenuItem]()

    private let contactUseCase: ContactUseCaseProtocol

    init(contactUseCase: ContactUseCaseProtocol) {
        self.contactUseCase = contactUseCase
    }

    func fetchData() {
        hireContextMenuItem = contactUseCase.fetchData()
    }
}
