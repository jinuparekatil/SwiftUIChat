//
//  Message.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 08/09/2024.
//

import FirebaseFirestore
import Firebase
struct Message : Codable ,Identifiable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
}
