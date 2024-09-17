//
//  ConversationsView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                
                //chats
                ScrollView{
                    VStack(alignment: .leading){
                        ForEach((0 ... 10), id: \.self) { _ in
                            NavigationLink(destination: {
                                ChatView(user: MOCK_USER)
                            }, label: { ConversationCell() })
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                //Floating Button
                Button(action: {
                    showNewMessageView.toggle()
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                        .padding()
                })
                .background(Color(.systemBlue))
                .foregroundStyle(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $showNewMessageView, content: {
                    NewMessageView(showChatView: $showChatView, user: $selectedUser)
                })
            }
                .navigationDestination(isPresented: $showChatView) {
                    if let user = selectedUser {
                    ChatView(user: user)
                }
            }
        }
    }
}

#Preview {
    ConversationsView()
}
