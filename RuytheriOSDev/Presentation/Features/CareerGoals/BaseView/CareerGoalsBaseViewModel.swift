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

    func hireMeAction() {
        // TODO
    }
}
