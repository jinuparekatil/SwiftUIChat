//
//  SettingCellViewModel.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

enum SettingCellsViewModel : Int, CaseIterable {
    case account
    case notifications
    case starredMessages
    
    var title: String{
        switch self {
        case .account:
             "Account"
        case .notifications:
            "Notifications"
        case .starredMessages:
            "Starres Messages"
        }
    }
    
    var imageName: String{
        switch self {
        case .account:
             "key.fill"
        case .notifications:
            "bell.badge.fill"
        case .starredMessages:
            "star.fill"
        }
    }
    var backgroundColor: Color{
        switch self {
        case .account:
                .blue
        case .notifications:
                .red
        case .starredMessages:
                .yellow
        }
    }
    var destination: some View {
        switch self {
        case .account:
                Text("Account")
        case .notifications:
            Text("Notifications")
        case .starredMessages:
            Text("Starred Messages")
        }
    }
}
