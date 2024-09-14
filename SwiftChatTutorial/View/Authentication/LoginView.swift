//
//  LoginView.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 02/09/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading ,spacing: 12){
                HStack{ Spacer()}
                Text("Hello.")
                    .font(.largeTitle)
                    .bold()
                Text("Welcome back")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .bold()
                
                VStack(spacing: 40) {
                    CustomTextField(imageName: "envelope",
                                    placeholderText: "Email",
                                    isSecureField: false,
                                    text: $email )
                    
                    CustomTextField(imageName: "lock",
                                    placeholderText: "Password",
                                    isSecureField: true,
                                    text: $password)
                }
                .padding([.top, .horizontal],32)
            }
            .padding(.leading)
            
            HStack {
                Spacer()
                NavigationLink(destination: {
                    Text("Reset Password..")
                }, label: {
                    Text("Forgot Password?")
                        .font(.system(size: 13,weight: .semibold))
                        .padding(.top)
                        .padding(.trailing,28)
                })
            }
           
            Button(action: {
                viewModel.login()
            }, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            .shadow(color: .gray,radius: 10, x: 0.0,y: 0.0)
            Spacer()
            NavigationLink(destination: RegistrationView()) {
                HStack {
                    Text("Don't have an account?")
                        .font(.system(size: 14))
                    Text("Sign Up")
                        .font(.system(size: 14, weight: .semibold))
                }
            }.padding(.bottom,32)
             

        }
        .padding(.top,-56)
    }
}

#Preview {
    LoginView()
}

