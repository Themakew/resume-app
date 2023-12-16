//
//  PassionSheetViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-15.
//

import SwiftUI

protocol PassionSheetViewModelProtocol {
    var screenData: [PassionSheetViewModel.Item] { get set }
    var totalItems: String { get }

    func fetchData()
}

@Observable final class PassionSheetViewModel: PassionSheetViewModelProtocol {
    var screenData = [Item]()
    var totalItems = ""

    struct Item: Identifiable {
        let id = UUID()
        var imageName: String
        let description: String
        var pagination: String
    }
}

extension PassionSheetViewModel {
    func fetchData() {
        screenData = [
            Item(
                imageName: "coding",
                description: "I love coding and have a keen eye for improving the user experience, often drawing inspiration from successful apps. 😎💻",
                pagination: ""
            ),
            Item(
                imageName: "drums",
                description: "Drumming at church, each beat reflects my love for rhythm, creativity, and devotion to God. 🥁🎶",
                pagination: ""
            )
            ,
            Item(
                imageName: "gaming",
                description: "Gaming excites me with its engaging worlds and interactive stories. 🎮✨",
                pagination: ""
            )
            ,
            Item(
                imageName: "lovedOnes",
                description: "I value the time with my loved ones, finding joy and fulfillment in our shared moments and deep connections. 💕👨‍👩‍👧‍👦",
                pagination: ""
            )
            ,
            Item(
                imageName: "travelling",
                description: "Traveling fuels my love since each new adventure delivers a variety of experiences that extend my horizons and enrich my life with diverse cultures. ✈️🧳",
                pagination: ""
            )
        ]

        getTotalNumberOfItemList()
    }

    private func getTotalNumberOfItemList() {
        let total = screenData.count
        screenData = screenData.enumerated().map { index, item in
            var newItem = item
            newItem.pagination = "\(index + 1)/\(total)"
            return newItem
        }
    }
}
