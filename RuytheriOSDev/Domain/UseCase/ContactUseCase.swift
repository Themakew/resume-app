//
//  ContactUseCase.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-19.
//

import UIKit

protocol ContactUseCaseProtocol {
    func fetchData() -> [ContactUseCase.MenuItem]
}

final class ContactUseCase: ContactUseCaseProtocol {
    struct MenuItem: Identifiable {
        let id = UUID()
        let title: String
        var link: URL?
        var icon: String?
        var actionType: ActionType?
        var action: ((ActionType) -> Void)?
        var subMenuItems: [MenuItem]?
    }

    enum ActionType {
        case copyNumber
        case callNumber
        case copyEmail
        case sendEmail
        case linkedIn
        case none
    }

    func fetchData() -> [ContactUseCase.MenuItem] {
        return [
            MenuItem(title: "Phone Number", icon: "callRinging", subMenuItems: [
                MenuItem(title: "Copy Number", actionType: .copyNumber) { [weak self] actionType in
                    self?.handleAction(actionType)
                },
                MenuItem(title: "Call me", actionType: .callNumber) { [weak self] actionType in
                    self?.handleAction(actionType)
                }
            ]),
            MenuItem(title: "Email", icon: "envelope", subMenuItems: [
                MenuItem(title: "Copy Email", actionType: .copyEmail) { [weak self] actionType in
                    self?.handleAction(actionType)
                },
                MenuItem(title: "Send Email", actionType: .sendEmail) { [weak self] actionType in
                    self?.handleAction(actionType)
                }
            ]),
            MenuItem(
                title: "LinkedIn",
                link: URL(string: ContactEntity.linkedin),
                icon: "linkedin"
            )
        ]
    }

    private func handleAction(_ action: ActionType) {
        switch action {
        case .copyNumber:
            copyNumber(number: ContactEntity.phoneNumber)
        case .copyEmail:
            copyNumber(number: ContactEntity.emailAddress)
        case .callNumber:
            callNumber(number: ContactEntity.phoneNumber)
        case .sendEmail:
            sendEmail(email: ContactEntity.emailAddress)
        case .linkedIn:
            break
        case .none:
            break
        }
    }

    private func copyNumber(number: String) {
        UIPasteboard.general.string = number
    }

    private func callNumber(number: String) {
        if let phoneURL = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL)
        } else {
            print("Error to find phoneURL")
        }
    }

    private func sendEmail(email: String) {
        if let email = email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let emailURL = URL(string: "mailTo: \(email)") {
                if UIApplication.shared.canOpenURL(emailURL) {
                    UIApplication.shared.open(emailURL)
                } else {
                    print("Error to find emailURL")
                }
            }
        }
    }
}
