//
//  SettingsView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
//            Color(.systemGroupedBackground)
//                .ignoresSafeArea()
            NavigationStack {
                Form {
                    // Profile Section
                    Section {
                        HStack {
                            // Wrap NavigationLink inside HStack to hide the indicator
                            NavigationLink(destination: EditProfileView()) {
                                SettingsHeaderView()
                            }

                        }
                      
                    }
                
                           
                            // Settings Option
                            Section {
                                ForEach(SettingCellsViewModel.allCases , id: \.self) { viewModel in
                                    SettingsCell(viewModel: viewModel)

                                }
                            }
                            
            
                            
                            Section {
                                Button(action: {
                                    AuthViewModel.shared.signOut()
                                }) {
                                    Text("Log Out")
                                        .font(.headline)
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.red)
                                }
                                
                            }
                        }
                        .navigationTitle("Settings")
                    }
        }
    }
}

#Preview {
    SettingsView()
}
