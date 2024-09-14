//
//  RegistrationView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {

                VStack(alignment: .leading ,spacing: 12){
                    HStack{ Spacer()}
                    Text("Get started.")
                        .font(.largeTitle)
                        .bold()
                    Text("Create your account.")
                        .foregroundStyle(.blue)
                        .font(.largeTitle)
                        .bold()
                    
                    VStack(spacing: 40) {
                        CustomTextField(imageName: "envelope",
                                        placeholderText: "Email",
                                        isSecureField: false,
                                        text: $email )
                        
                        CustomTextField(imageName: "person",
                                        placeholderText: "Username",
                                        isSecureField: false,
                                        text: $userName )
                        
                        CustomTextField(imageName: "envelope",
                                        placeholderText: "Fullname",
                                        isSecureField: false,
                                        text: $fullName )
                        
                        CustomTextField(imageName: "lock",
                                        placeholderText: "Password",
                                        isSecureField: true,
                                        text: $password)
                    }
                    .padding([.top, .horizontal],32)
                }
                .padding(.leading)
                
                    Button(action: {
                        viewModel.register(withEmail: email, password: password, fullname: fullName, username: userName)
                    }, label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 340, height: 50)
                            .background(.blue)
                            .clipShape(Capsule())
                            .padding()
                    })
                    .padding(.top, 24)
                    .shadow(color: .gray,radius: 10, x: 0.0,y: 0.0)
                    
                    Spacer()
                
                Button(action: {
                    dismiss()
                }, label: {
                  
                        HStack {
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }).padding(.bottom,32)

            }
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser, destination: {
                ProfilePhotoSelecterView()
                   
            })
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegistrationView()
    
}
