//
//  MainTabView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewmodel: AuthViewModel
    var body: some View {
        if let user =  viewmodel.currentUser {
            TabView {
                NavigationStack {
                    ConversationsView()
                        .navigationTitle("Conversations")
                }
                .tabItem {
                    Image(systemName: "bubble.left")
                }
                
                NavigationStack {
                    ChannelsView()
                        .navigationTitle("Channels")
                }
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                }
                
                NavigationStack {
                    SettingsView(user: user)
                        .navigationTitle("Settings")
                }
                .tabItem {
                    Image(systemName: "gear")
                }
            }
        }
        else {
            // Failed to show current user
        }


    }
}

#Preview {
    MainTabView()
}
