//
//  UserCell.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 07/09/2024.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack {
            //Image
            Image("venom-7")
                .resizable()
                .scaledToFill()
                .frame(width: 48,height: 48)
                .clipShape(Circle())
            //message Info
            VStack(alignment: .leading) {
                Text("Eddie Broke")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("")
            }
        }
    }
}

#Preview {
    ConversationCell()
}
