//
//  CustomTextField.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct CustomTextField: View {
    var imageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
   
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundStyle(.secondary)
                if isSecureField {
                    SecureField(placeholderText,text: $text)
                } else {
                    TextField(placeholderText,text: $text)
                }
            }
            Divider()
                .background(.secondary)
        }
    }
}
