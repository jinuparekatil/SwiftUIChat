//
//  ImageUploader.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 12/09/2024.
//

import UIKit
import FirebaseStorage


struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "profile_image/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload with error\(error)")
                return
            }
            #if DEBUG
              print("DEBUG: Successfully updated image to firestore..")
            #endif
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
            
        }
    }
}
//


