//
//  Message.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 08/09/2024.
//

import Foundation

struct Message : Identifiable {
    var id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
