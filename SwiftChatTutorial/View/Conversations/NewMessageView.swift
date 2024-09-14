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
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            VStack(alignment: .leading) {
                ForEach((0 ... 10) ,id: \.self){_ in
                    Button(action: {
                        showChatView.toggle()
                        dismiss()
                    }, label: {
                        UserCell()
                    })
                    
                }
            }
        }
    }
}

#Preview {
    NewMessageView(showChatView: .constant(true))
}
