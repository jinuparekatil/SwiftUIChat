//
//  SettingsHeaderView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        HStack{
            Image("venom-7")
                .resizable()
                .scaledToFill()
                .frame(width: 64,height: 64)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Eddie Broke")
                    .font(.headline)
                Text("Available")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
        }
    }
}

#Preview {
    SettingsHeaderView()
}
