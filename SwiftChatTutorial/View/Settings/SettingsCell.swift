//
//  SettingsCell.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

//struct SettingsCell: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) { // Adjust spacing for better layout
//            CustomNavigationLink(destination: Text("Account Settings"), imageName: "key.fill", backgroundColor: .blue, text: "Account")
//            
//            CustomNavigationLink(destination: Text("Notification Settings"), imageName: "bell.fill", backgroundColor: .red, text: "Notifications")
//            
//            CustomNavigationLink(destination: Text("Starred Messages"), imageName: "star.fill", backgroundColor: .yellow, text: "Starred Messages")
//        }
//        .padding() // Optionally add padding around the VStack
//    }
//}

struct SettingsCell: View {
    let viewModel: SettingCellsViewModel

    var body: some View {
        NavigationLink(destination: viewModel.destination) {
            HStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .foregroundStyle(.white)
                    .background(viewModel.backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                Text(viewModel.title)
                    .foregroundColor(.primary) // Ensure text color adapts to light/dark mode
            }
        }
    }
}

//
//#Preview {
//    SettingsCell()
//}
