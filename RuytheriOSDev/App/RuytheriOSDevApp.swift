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

    let parentViewModel = BaseTabViewModel()
    var body: some Scene {
        WindowGroup {
            BaseTabView(viewModel: parentViewModel)
        }
    }
}
