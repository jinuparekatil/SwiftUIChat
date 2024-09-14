//
//  EditProfileView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 04/09/2024.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullName = "Eddie Broke"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage? = nil  // Parent's state property
    @State private var profileImage: Image?
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 44) {
                //header
                VStack{
                    //photos/ edit button / text
                    HStack {
                        // photo // edit button
                        VStack {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64,height: 64)
                                    .clipShape(Circle())
                            } else {
                                Image("venom-7")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64,height: 64)
                                    .clipShape(Circle())
                            }
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("Edit")
                            })
                        }
                        .sheet(isPresented: $showImagePicker, onDismiss: loadImage,content: {
                            ImagePicker(image: $selectedImage)
                        })
                        .padding(.top)
                        Text("Enter your name or change your profile photo")
                            .font(.system(size: 16))
                            .foregroundStyle(.gray)
                            .padding([.bottom,.horizontal])
                    }
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("",text: $fullName)
                        .padding(8)
                        .background(.white)
                }
                .background(.white)
                //status
                VStack {
                    // status text
                    Text("Status")
                        .padding()
                        .foregroundStyle(.gray)
                
                    // status
                    NavigationLink(destination: StatusSelectorView(), label: {
                        HStack {
                            Text("At the movies")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .background(.white)
                    })
                   
                }
                Spacer()
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    func loadImage() {
        guard let image = selectedImage  else { return }
        profileImage = Image(uiImage: image)

    }
}

#Preview {
    EditProfileView()
}
