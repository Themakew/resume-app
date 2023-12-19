//
//  ParentViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case aboutMe
    case careerGoals
    case education
    case experience
    case passions

    var title: String {
        switch self {
        case .aboutMe:
            return "About me"
        case .careerGoals:
            return "Career Goals"
        case .education:
            return "Education"
        case . experience:
            return "Experience"
        case .passions:
            return "Passions"
        }
    }

    var iconTitle: String {
        switch self {
        case .aboutMe:
            return "user"
        case .careerGoals:
            return "trophy"
        case .education:
            return "motherboard"
        case . experience:
            return "book"
        case .passions:
            return "heart"
        }
    }

    var backgroundViewTitle: String {
        switch self {
        case .aboutMe:
            return "About Me 🤔"
        case .careerGoals:
            return "Dreams to Reality 🚀"
        case .education:
            return "Scroll up to discover 📚"
        case . experience:
            return "Professional Path 🧑🏾‍💻"
        case .passions:
            return "Versions of me 😄"
        }
    }
}

protocol BaseTabViewModelProtocol {
    var activeTab: Tab { get set }
    var selectedDetent: PresentationDetent { get set }

    var hireContextMenuItem: [ContactUseCase.MenuItem] { get set }

    func updateSheetDetentStatus()
    func fetchData()
}

@Observable final class BaseTabViewModel: BaseTabViewModelProtocol {
    let customToolbarTitle = "Hire me"

    var activeTab: Tab = .aboutMe
    var selectedDetent = PresentationDetent.height(110)
    var hireContextMenuItem = [ContactUseCase.MenuItem]()

    private let contactUseCase: ContactUseCaseProtocol
    private var lastActiveTab: Tab = .aboutMe
    private var sheetStatusByTab: [Tab: PresentationDetent] = [
        .aboutMe: .height(110), .careerGoals: .height(110), .education: .height(110), .experience: .height(110), .passions: .height(110)
    ]

    init(contactUseCase: ContactUseCaseProtocol) {
        self.contactUseCase = contactUseCase
    }

    func updateSheetDetentStatus() {
        sheetStatusByTab[lastActiveTab] = selectedDetent

        if let detent = sheetStatusByTab[activeTab] {
            selectedDetent = detent
        }

        lastActiveTab = activeTab
    }

    func fetchData() {
        hireContextMenuItem = contactUseCase.fetchData()
    }
}
