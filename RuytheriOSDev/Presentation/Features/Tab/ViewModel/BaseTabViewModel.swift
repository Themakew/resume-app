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

    func updateSheetDetentStatus()
}

@Observable final class BaseTabViewModel: BaseTabViewModelProtocol {
    let customToolbarTitle = "Hire me"

    var activeTab: Tab = .aboutMe
    var selectedDetent = PresentationDetent.height(100)

    private var lastActiveTab: Tab = .aboutMe
    private var sheetStatusByTab: [Tab: PresentationDetent] = [
        .aboutMe: .height(110), .careerGoals: .height(110), .education: .height(110), .experience: .height(110), .passions: .height(110)
    ]

    func updateSheetDetentStatus() {
        sheetStatusByTab[lastActiveTab] = selectedDetent

        if let detent = sheetStatusByTab[activeTab] {
            selectedDetent = detent
        }

        lastActiveTab = activeTab
    }
}
