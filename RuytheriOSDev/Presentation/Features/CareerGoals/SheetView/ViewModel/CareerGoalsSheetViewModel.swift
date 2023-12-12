//
//  CareerGoalsSheetViewModel.swift
//  RuytheriOSDev
//
//  Created by Ruyther Costa on 2023-12-09.
//

import SwiftUI

protocol CareerGoalsSheetViewModelProtocol {
    var topBubbleText: String { get }
    var middleBubbleText: String { get }
    var bottomBubbleText: String { get }
    var bubbleWidth: CGFloat { get }
    var bubbleHeight: CGFloat { get }
    var bubblePadding: EdgeInsets { get }
}

final class CareerGoalsSheetViewModel: CareerGoalsSheetViewModelProtocol {
    let topBubbleText = "5+ years: Aiming to become Head of Development, leading projects and empowering teams. Focused on innovation, mentoring new talent, and enriching the tech community. 🚀🌟"
    let middleBubbleText = "2-5 years: Aiming for a specialist role in iOS, driving innovation, and mentoring new talent. Focused on impactful solutions and tech advancement. Your iOS expert and innovator! 💡🔍"
    let bottomBubbleText = "1-2yrs: Aiming for a senior role, mentoring iOS newcomers, and being the team's tech guru. Ready to share insights and cheer on our successes. Your iOS guide and ally! 🌟📱"

    let bubbleWidth: CGFloat = 350.0
    let bubbleHeight: CGFloat = 110.0
    let bubblePadding = EdgeInsets(top: 4, leading: 16, bottom: 16, trailing: 10)
}
