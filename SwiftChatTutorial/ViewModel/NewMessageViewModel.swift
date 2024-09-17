//
//  NewMessageViewModel.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 15/09/2024.
//

import SwiftUI


class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({try? $0.data(as: User.self)}).filter({$0.id != AuthViewModel.shared.userSession?.uid})
            
            documents.forEach { document in
                guard let user = try? document.data(as: User.self) else { return }
                self.users.append(user)
                
#if DEBUG
                print("DEBUG: user \(self.users)")
#endif

            }
        }
    }
}
