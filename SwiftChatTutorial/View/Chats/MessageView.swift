//
//  MessageView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 08/09/2024.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser: Bool
    var messageText: String
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text(messageText)
                    .padding(12)
                    .background(Color(.blue))
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .foregroundStyle(.white)
                    .padding(.leading ,100)
                    .padding(.horizontal)
                
            } else {
                HStack(alignment: .bottom) {
                    Image("venom-7")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    Text(messageText)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .foregroundStyle(.black)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

//x
