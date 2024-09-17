//
//  UserCell.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 07/09/2024.
//

import SwiftUI
import Kingfisher
struct UserCell: View {
    let user: User
    var body: some View {
        VStack {
            HStack {
                //Image
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48,height: 48)
                    .clipShape(Circle())
                //message Info
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(user.fullname)
                        .font(.system(size: 15))
                }
                .foregroundStyle(.black)
                Spacer()
            }
            .padding(.horizontal)
        }
        
    }
}

//#Preview {
//    UserCell()
//}
