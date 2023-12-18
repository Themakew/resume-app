//
//  EducationSheetViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-13.
//

import SwiftUI

protocol EducationSheetViewModelProtocol {
    var screenData: [EducationSheetViewModel.Sections] { get set }

    func fetchData()
}

@Observable final class EducationSheetViewModel: EducationSheetViewModelProtocol {
    var screenData = [Sections]()

    // Sections
    enum Sections: Identifiable {
        case educationSection(ListingSection)
        case certificateSection(CertificateSection)
        case skillSection(BubbleSection)

        var id: UUID {
            return UUID()
        }
    }

    struct ListingSection: Identifiable {
        let id = UUID()
        var imageName: String?
        let title: String
        let sectionRows: [EducationRow]
    }

    struct CertificateSection: Identifiable {
        let id = UUID()
        var imageName: String?
        let title: String
        let sectionRows: [CertificateRow]
    }

    struct BubbleSection: Identifiable {
        let id = UUID()
        let title: String
        let skillList: [Skill]
    }

    // Education definition
    struct EducationRow: Identifiable {
        let id = UUID()
        let title: String
        let bulletPoints: [String]
    }

    // Certificate definition
    struct CertificateRow: Identifiable {
        let id = UUID()
        let title: String
        let location: String
        let date: String
    }

    // Skills definition
    struct Skill: Identifiable {
        let id = UUID()
        let title: String
        let skillLevel: SkillLevel

        enum SkillLevel: String {
            case basic
            case elementary
            case intermediate
            case advanced
        }
    }
}

extension EducationSheetViewModel {
    func fetchData() {
        screenData = [
            .educationSection(ListingSection(
                imageName: "education",
                title: "My Education",
                sectionRows: [
                    EducationRow(
                        title: "University of Brasília",
                        bulletPoints: [
                            "Master's degree certificate",
                            "Dissertation on mobile usability evaluation",
                            "Research paper approved on HCI Conference and IEEE Journal"
                        ]
                    )
                ]
            )),
            .certificateSection(CertificateSection(
                imageName: "certificate",
                title: "My certificates",
                sectionRows: [
                    CertificateRow(title: "Apple Developer Program", location: "Brasília, Brazil", date: "2015"),
                    CertificateRow(title: "Adobe and Autodesk Tools", location: "Brasília, Brazil", date: "2014"),
                ]
            )),
            .skillSection(BubbleSection(
                title: "My Skills",
                skillList: [
                    Skill(title: "Swift", skillLevel: .advanced),
                    Skill(title: "MMVM-C", skillLevel: .advanced),
                    Skill(title: "Scrum", skillLevel: .intermediate),
                    Skill(title: "Rest API Intergration", skillLevel: .advanced),
                    Skill(title: "UIKit", skillLevel: .intermediate),
                    Skill(title: "SwiftUI", skillLevel: .basic),
                    Skill(title: "iOS Animation", skillLevel: .elementary),
                    Skill(title: "Cocoapods", skillLevel: .intermediate),
                    Skill(title: "SPM", skillLevel: .intermediate),
                    Skill(title: "Git", skillLevel: .intermediate),
                    Skill(title: "UI Design", skillLevel: .basic),
                    Skill(title: "Mobile Usability (UX)", skillLevel: .advanced),
                ]
            ))
        ]
    }
}
