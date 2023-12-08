//
//  AboutMeBaseViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-06.
//

import SwiftUI

protocol AboutMeBaseViewModelProtocol {
    var viewTitle: String { get }
    var helloLabel: String { get }
    var nameLabel: String { get }
}

@Observable final class AboutMeBaseViewModel: AboutMeBaseViewModelProtocol {
    var viewTitle = "Hire me"
    var helloLabel = "Hello,"
    var nameLabel = "I am Ruyther!"
}
