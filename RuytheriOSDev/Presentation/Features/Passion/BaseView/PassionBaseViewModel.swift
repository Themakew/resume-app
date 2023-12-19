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
    var hireContextMenuItem = [ContactUseCase.MenuItem]()

    private let contactUseCase: ContactUseCaseProtocol

    init(contactUseCase: ContactUseCaseProtocol) {
        self.contactUseCase = contactUseCase
    }

    func fetchData() {
        hireContextMenuItem = contactUseCase.fetchData()
    }
}
