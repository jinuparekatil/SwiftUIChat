//
//  ContentView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            Group {
                if (viewModel.userSession != nil) {
                    MainTabView()
                } else {
                    LoginView()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
