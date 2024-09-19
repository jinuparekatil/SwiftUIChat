//
//  ChatView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    
    private let user: User
    init( user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    var body: some View {
        VStack {
            //messages
            ScrollViewReader { proxy in

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) {message in
                        MessageView(viewmodel: MessageViewModel(message: message))
                    }
                }
            }
            .onChange(of: viewModel.messages.count) { _,_ in
                               // Scroll to the bottom when a new message is added
                               if let lastMessage = viewModel.messages.last {
                                   withAnimation {
                                       proxy.scrollTo(lastMessage.id, anchor: .bottom)
                                   }
                               }
                           }
                       }
            //input view
            CustomInputView(text: $messageText,action: sendMeassage)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    func sendMeassage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

//#Preview {
//    ChatView()
//}
