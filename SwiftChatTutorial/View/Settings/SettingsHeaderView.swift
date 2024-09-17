//
//  SettingsHeaderView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI
import Kingfisher
struct SettingsHeaderView: View {
    var user: User
    init(user: User) {
        self.user = user
    }
    var body: some View {
        HStack{
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 64,height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text(user.fullname)
                    .font(.headline)
                Text("Available")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
        }
    }
}
//
//#Preview {
//    SettingsHeaderView()
//}
