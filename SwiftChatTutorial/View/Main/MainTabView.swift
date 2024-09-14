//
//  MainTabView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
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
                SettingsView()
                    .navigationTitle("Settings")
            }
            .tabItem {
                Image(systemName: "gear")
            }
        }


    }
}

#Preview {
    MainTabView()
}
