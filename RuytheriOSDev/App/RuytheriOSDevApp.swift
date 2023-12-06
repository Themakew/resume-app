//
//  RuytheriOSDevApp.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

@main
struct RuytheriOSDevApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate

    let parentViewModel = ParentViewModel()

    var body: some Scene {
        WindowGroup {
            ParentView(viewModel: parentViewModel)
        }
    }
}
