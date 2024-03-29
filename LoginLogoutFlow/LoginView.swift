//
//  LoginView.swift
//  LoginLogoutFlow
//
//  Created by Gaspar Dolcemascolo on 16/03/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State var email = ""
    @State var password = ""
    
    fileprivate func EmailInput() -> some View {
        TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)
    }
    
    fileprivate func PasswordInput() -> some View {
        SecureField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
    }
    
    fileprivate func LoginButton() -> some View {
        Button(action: {
            Task {
                await self.vm.signIn(
                    email: email,
                    password:password
                )
            }
        }) {
            Text("Sign In")
        }
    }
    
    var body: some View {
        
        VStack{
            if(vm.isBusy){
                ProgressView()
            }else{
                Text("Login Screen").font(.title)
                EmailInput()
                PasswordInput()
                LoginButton()
            }
        }.padding()
        
    }
}

#Preview {
    LoginView()
}
