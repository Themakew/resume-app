//
//  AboutMeSheetViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-06.
//

import SwiftUI

protocol AboutMeSheetViewModelProtocol {
    var screenData: [AboutMeSheetViewModel.ListItem] { get set }

    func fetchData()
}

@Observable final class AboutMeSheetViewModel: AboutMeSheetViewModelProtocol {
    var screenData = [ListItem]()

    enum ListItem: Identifiable {
        case bubble(BubbleData)
        case language(LanguageData)
        case location(LocationData)

        var id: UUID {
            return UUID()
        }
    }

    struct BubbleData: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let expandedBuble: Bool
    }

    struct LanguageData: Identifiable {
        let id = UUID()
        let title: String
        let firstLanguageTitle: String
        let firstLanguageValue: Double
        let secondLanguageTitle: String
        let secondLanguageValue: Double
    }

    struct LocationData: Identifiable {
        let id = UUID()
        let title: String
        let location: String
    }
}

extension AboutMeSheetViewModel {
    func fetchData() {
        screenData = [
            .bubble(
                BubbleData(
                    title: "Who am I?",
                    description: "I am a Brazilian and an aspiring Canadian who is thrilled by technology and its transformational power. Passionate about learning, particularly in technology and music. 👨🏾‍💻❤️🥁",
                    expandedBuble: false
                )
            ),
            .bubble(
                BubbleData(
                    title: "Who am I looking for?",
                    description: "I am looking for an iOS developer position on exciting projects that will provide challenges and user-centric solutions. I can't wait to create something that will have an impact on people's lives! 📱⌚️",
                    expandedBuble: true
                )
            ),
            .language(
                LanguageData(
                    title: "What languages do I speak?",
                    firstLanguageTitle: "English",
                    firstLanguageValue: 0.9,
                    secondLanguageTitle: "Portuguese",
                    secondLanguageValue: 1.0
                )
            ),
            .location(
                LocationData(title: "Where do I live?", location: "Calgary, Alberta")
            )
        ]
    }
}
