//
//  UserCell.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 07/09/2024.
//

import SwiftUI

struct ConversationCell: View {
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
                    Text("Eddie Broke")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("This is some test meassage for now...")
                        .font(.system(size: 15))
                }.foregroundStyle(.black)
                Spacer()
            }
            .padding(.horizontal)
            Divider()
        }
        .padding(.top)
    }

}

#Preview {
    ConversationCell()
}
