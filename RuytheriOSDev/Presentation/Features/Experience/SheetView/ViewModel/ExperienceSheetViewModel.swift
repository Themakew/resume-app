//
//  ExperienceSheetViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-15.
//

import SwiftUI

protocol ExperienceSheetViewModelProtocol {
    var screenData: [ExperienceSheetViewModel.Item] { get set }

    func fetchData()
}

@Observable final class ExperienceSheetViewModel: ExperienceSheetViewModelProtocol {
    var screenData = [Item]()

    struct Item: Identifiable {
        let id = UUID()
        var title: String
        let subtitle: String
        let bulletPoints: [String]
    }
}

extension ExperienceSheetViewModel {
    func fetchData() {
        screenData = [
            Item(
                title: "iOS Engineer",
                subtitle: "DATUM, Brazil, Feb 2023 - Sep 2023",
                bulletPoints: [
                    "Internet Banking App",
                    "Steered 2/3 of the iOS team in redesigning the app's PIX module (Brazil's instant payment method), employing MVVM-C and effective communication, enhancing architectural comprehension, and cutting code errors by over 50%",
                    "Developed an entirely new investments feature on the iOS app, designed to engage 10% of the user base, with a projection to boost revenue",
                    "Resolved a critical application bug identified by Firebase Crashlytics, resulting in 99% of users (a 1% increase) no longer experiencing application failures in Digio and Uber Account",
                    "Optimized Digio and Uber Account apps with modular Swift code and GCD best practices, reducing crashes by 50% and enhancing user satisfaction"
                ]
            ),
            Item(
                title: "iOS Engineer",
                subtitle: "RGA, Brazil, Nov 2021 - Dec 2022",
                bulletPoints: [
                    "Fintech and School App",
                    "Leveraged expertise on best iOS development practices to disseminate knowledge among the team, resulting in a reduction of severe usability issues by over 50%",
                    "Implemented a unit testing approach using Test Doubles for the sign-up feature, achieving 100% test coverage of the ViewModels in line with the modularized architecture",
                    "Conducted comprehensive code reviews, ensuring adherence to the MVVM-C pattern for every new feature in the app; resulted in a 30% decrease in bugs and improved overall app stability"
                ]
            ),
            Item(
                title: "iOS Engineer",
                subtitle: "Zup Innovation, Brazil, May 2021 - Nov 2021",
                bulletPoints: [
                    "Credit Card App",
                    "Initiated and executed the architectural shift to MVVM-C in the Credicard On app (from Itaú) using Swift and RxSwift, boosting code maintainability by 10%",
                    "Spearheaded a collaborative effort with the UI/UX team, applying mobile usability heuristics to new features, reducing user errors by 50%"
                ]
            ),
            Item(
                title: "iOS Engineer",
                subtitle: "IBM, Brazil, Nov 2020 - Sep 2021",
                bulletPoints: [
                    "Internet Banking App",
                    "Crafted robust Swift code with RxSwift, Quick, and Nimble, achieving over 50% test coverage",
                    "Fostered a collaborative environment, driving cross-functional knowledge exchange and enhancing team efficiency"
                ]
            ),
            Item(
                title: "iOS Engineer",
                subtitle: "Fóton Informática, Brazil, Aug 2019 - Sep 2020",
                bulletPoints: [
                    "Internet Banking App",
                    "Took the initiative to dig deeper into the VoiceOver API, paving the way for the creation of 100% accessible features for people with disabilities, such as blindness and limited vision"
                ]
            )
        ]
    }
}
