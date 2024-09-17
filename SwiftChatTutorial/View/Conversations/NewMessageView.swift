//
//  NewMessageView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 07/09/2024.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            VStack(alignment: .leading) {
                ForEach(viewModel.users){ user in
                    Button(action: {
                        showChatView.toggle()
                        self.user = user
                        dismiss()
                    }, label: {
                        UserCell(user: user)
                    })
                    
                }
            }
        }
    }
}

//#Preview {
//    NewMessageView(showChatView: .constant(true))
//}
