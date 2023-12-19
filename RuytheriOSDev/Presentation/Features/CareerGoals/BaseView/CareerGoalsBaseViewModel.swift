//
//  CareerGoalsBaseViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-08.
//

import SwiftUI

@Observable final class CareerGoalsBaseViewModel: TabBackgroundViewModelProtocol {
    var viewTitleText = "Hire me"
    var firstTitleText = "My"
    var secondTitleText = "Goals"
    var backgroundPhotoName = "goals"
    var tabType: Tab = .careerGoals
    var hireContextMenuItem = [ContactUseCase.MenuItem]()

    private let contactUseCase: ContactUseCaseProtocol

    init(contactUseCase: ContactUseCaseProtocol) {
        self.contactUseCase = contactUseCase
    }

    func fetchData() {
        hireContextMenuItem = contactUseCase.fetchData()
    }
}
