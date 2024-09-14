//
//  UserCell.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 07/09/2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack {
                //Image
                Image("venom-7")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48,height: 48)
                    .clipShape(Circle())
                //message Info
                VStack(alignment: .leading, spacing: 4) {
                    Text("venom")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Eddie Broke")
                        .font(.system(size: 15))
                }
                .foregroundStyle(.black)
                Spacer()
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    UserCell()
}
