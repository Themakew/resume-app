//
//  SceneDelegate.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-05.
//

import SwiftUI

@Observable final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    weak var windowScene: UIWindowScene?
    var tabWindow: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        windowScene = scene as? UIWindowScene
    }

    func addTabView(_ viewModel: Binding<BaseTabViewModel>) {
        guard let scene = windowScene else {
            return
        }

        // Create the CustomTabView
        let customTabView = CustomTabView(viewModel: viewModel)
            .frame(maxHeight: .infinity, alignment: .bottom)

        // Set up the hosting controller
        let tabViewController = UIHostingController(rootView: customTabView)
        tabViewController.view.backgroundColor = .clear

        // Create and configure the PassThroughWindow
        let tabWindow = PassThroughtWindow(windowScene: scene)
        tabWindow.rootViewController = tabViewController
        tabWindow.backgroundColor = .clear
        tabWindow.isHidden = false

        self.tabWindow = tabWindow
    }
}

final class PassThroughtWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else {
            return nil
        }

        return rootViewController?.view == view ? nil : view
    }
}
