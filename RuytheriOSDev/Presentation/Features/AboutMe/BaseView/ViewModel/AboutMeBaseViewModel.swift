//
//  AboutMeBaseViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-06.
//

import SwiftUI

protocol AboutMeBaseViewModelProtocol {
    var viewTitle: String { get }
}

@Observable final class AboutMeBaseViewModel: AboutMeBaseViewModelProtocol {
    var viewTitle = "Hire me"
}
