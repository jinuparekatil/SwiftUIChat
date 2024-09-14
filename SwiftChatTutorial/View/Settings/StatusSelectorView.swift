//
//  StatusSelectorView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 06/09/2024.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("CURRENTLY SET TO")
                        .foregroundStyle(.gray)
                        .padding()
                    StatusCell(status: viewModel.status)

                    //Staatus Cell
                    
                    Text("SELECT YOU STATUS")
                        .foregroundStyle(.gray)
                        .padding()
                    // for loop with options
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured}), id: \.self) {status in
                        Button(action: {
                            viewModel.updateStatus(status)
                        }, label: {
                            StatusCell(status: status)
                        })
                        
                    }
                }
            }
        }
    }
}

#Preview {
    StatusSelectorView()
}

struct StatusCell: View {
    let status: UserStatus
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundStyle(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(.white)
    }
}
