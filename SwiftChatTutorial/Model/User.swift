//
//  User.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 14/09/2024.
//

import FirebaseFirestore

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
    }

let MOCK_USER = User(id: NSUUID().uuidString, username: "Test", fullname: "Test", email: "test@gmail.com", profileImageUrl: "www.google.com")
