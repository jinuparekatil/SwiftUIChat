//
//  MessageView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 08/09/2024.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let viewmodel: MessageViewModel
//    var messageText: String
    var body: some View {
        HStack {
            if viewmodel.isFromCurrentUser {
                Spacer()
                Text(viewmodel.message.text)
                    .padding(12)
                    .background(Color(.blue))
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: viewmodel.isFromCurrentUser))
                    .foregroundStyle(.white)
                    .padding(.leading ,100)
                    .padding(.horizontal)
                
            } else {
                HStack(alignment: .bottom) {
                    KFImage(viewmodel.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    Text(viewmodel.message.text)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: viewmodel.isFromCurrentUser))
                        .foregroundStyle(.black)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

//x
