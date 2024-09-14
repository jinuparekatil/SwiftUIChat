//
//  AuthViewModel.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 11/09/2024.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class AuthViewModel : NSObject,ObservableObject {
    
    @Published var didAuthenticateUser: Bool = false
    private var tempCurrentUser : FirebaseAuth.User?
    func login() {
        print("Login user from viewmodel..")
    }
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to register with error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempCurrentUser = user

            let data:[String: Any] = [
                "email": email,
                "username": username,
                "fullname": fullname
            ]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print("Failed to update user info in Firestore: \(error.localizedDescription)")
                } else {
                    self.didAuthenticateUser = true
                }
            }
        }
    }
    
    func uploadProfileImage(_ image:UIImage) {
        ImageUploader.uploadImage(image: image) { imageUrl in
            guard let uid = self.tempCurrentUser?.uid else {
                #if DEBUG
                    print("DEBUG: failed to setup temp user  ")
                #endif

                return
            }
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl":imageUrl]) { _ in

            #if DEBUG
              print("DEBUG: Successfully updated user data..")
            #endif
            }
        }
    }
    
    func signOut() {
        
    }
}
