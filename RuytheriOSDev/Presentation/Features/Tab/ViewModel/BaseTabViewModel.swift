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
}

@Observable final class BaseTabViewModel: BaseTabViewModelProtocol {
    let customToolbarTitle = "Hire me"
    var activeTab: Tab = .aboutMe
}
