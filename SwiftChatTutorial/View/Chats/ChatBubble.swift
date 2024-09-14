//
//  ChatBubble.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 08/09/2024.
//

import SwiftUI

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSizeMake(16, 16))
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(isFromCurrentUser: true)
        .padding()
}
