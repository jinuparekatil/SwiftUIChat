//
//  ProfilePhotoSelecterView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 12/09/2024.
//

import SwiftUI

struct ProfilePhotoSelecterView: View {
    @State private var imagePickerPresented: Bool = false
    @State private var selectedImage: UIImage? = nil  // Parent's state property
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel : AuthViewModel

    
    var body: some View {
        VStack {
            Button(action: {
                imagePickerPresented.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180,height: 180)
                        .clipShape(Circle())
                }
                else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180,height: 180)
                        .clipped()
                        .padding(.top,44)
                        .foregroundStyle(.black)
                }
                
            })
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage,content: {
                ImagePicker(image: $selectedImage)
            })
            Text(profileImage == nil ? "Select a profile photo" : "Great! tap below to continue")
                .font(.system(size: 20, weight: .semibold))
            
            if let image =  selectedImage {
                Button(action: {
                    viewModel.uploadProfileImage(image)
                }, label: {
                    
                    Text("Continue")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .padding(.top,24)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    func loadImage() {
        guard let image = selectedImage  else { return }
        profileImage = Image(uiImage: image)

    }
}

#Preview {
    ProfilePhotoSelecterView()
}
