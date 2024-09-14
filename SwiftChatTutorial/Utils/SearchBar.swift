//
//  SearchBar.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 07/09/2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            TextField("Search ...",text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(width: 24, height: 24)
                            .padding(.leading, 8) // Adjust the padding as needed
                        Spacer()
                    }
                }
            if(isEditing) {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.black)
                })
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
//                .animation(.default,value: isEditing)
            }
        }
        .animation(.default, value: isEditing) // Apply animation to the entire HStack
        .padding()
    }
}

#Preview {
    SearchBar(text: .constant("Search..."), isEditing: .constant(false))
}
