//
//  ChatViewModel.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 08/09/2024.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var  messages = [Message]()
    init() {
        self.messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "What's up man"),
            .init(isFromCurrentUser: true, messageText: "Not much ,how are you?"),
            .init(isFromCurrentUser: false, messageText: "I'm doing fine, having building this app."),
            .init(isFromCurrentUser: true, messageText: "Are you learning alot?"),
            .init(isFromCurrentUser: false, messageText: "Yeah Iam, I love this course."),
            .init(isFromCurrentUser: true, messageText: "What's up man"),
            .init(isFromCurrentUser: false, messageText: "That's awesome, I am glad I bought it."),
            .init(isFromCurrentUser: false, messageText: "Talk to you later."),
            .init(isFromCurrentUser: true, messageText: " good night :)"),
        ]
    }
    
    func sendMessage(_ messageText: String){
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        self.messages.append(message)
    }
}
