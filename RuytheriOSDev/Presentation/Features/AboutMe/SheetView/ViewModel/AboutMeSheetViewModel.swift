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

    enum ListItem: Hashable {
        case bubble(BubbleData)
        case language(LanguageData)
        case location(LocationData)
    }

    struct BubbleData: Hashable {
        let title: String
        let description: String
    }

    struct LanguageData: Hashable {
        let title: String
        let firstLanguageTitle: String
        let firstLanguageValue: Double
        let secondLanguageTitle: String
        let secondLanguageValue: Double
    }

    struct LocationData: Hashable {
        let title: String
        let location: String
    }

    func fetchData() {
        screenData = [
            .bubble(
                BubbleData(
                    title: "Who am I?",
                    description: "Brazilian and future Canadian deeply passionate about technology and its transformative power. Passionate about learning, especially in tech and music. 👨🏾‍💻❤️🥁"
                )
            ),
            .bubble(
                BubbleData(
                    title: "Who am I looking for?",
                    description: "I am looking for an iOS Developer position on exciting projects that will provide challenges and user-centric solutions. I can't wait to create something that will have an impact on people's lives! 📱⌚️"
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
