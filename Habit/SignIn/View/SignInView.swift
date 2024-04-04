//
//  SignInView.swift
//  Habit
//
//  Created by Pedro Delmondes  on 25/03/2024.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    
    @State var action: Int? = 0
    
    @State var navigationHidden = true
    
    var body: some View {
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationStack {
                    
                    ScrollView(showsIndicators: true) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            Spacer(minLength: 48)
                            
                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding( .horizontal, 48)
                                
                                Text("Login")
                                    .foregroundStyle(.orange)
                                    .font(.title)
                                    .bold()
                                    .padding(.bottom, 8)
                                
                                emailField
                                
                                passwordField
                                
                                enterButton
                                
                                registerLink
                                
                                Text("Copyright 2024")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                                    .bold()
                                    .padding(.top, 16)
                                
                            }
                        }
                        if case SignInUIState.error(let value) = viewModel.uiState {
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(title: Text("Habit"),message: Text(value),dismissButton: .default(Text("Ok")) {
                                            
                                })
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .background(Color.white)
                    .navigationTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(navigationHidden)
                }
            }
        }
    }
}

extension SignInView {
    var emailField: some View {
        TextField("", text: $email)
            .border(Color.orange)
            .cornerRadius(5.0)
    }
}

extension SignInView {
    var passwordField: some View {
        SecureField("", text: $password)
            .border(Color.orange)
            .cornerRadius(5.0)
    }
}

extension SignInView {
    var enterButton: some View {
        Button("Entrar") {
            viewModel.login(email: email, password: password)
        }
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não possui cadastro?")
                .foregroundStyle(.gray)
                .padding(.top, 48)
            
            ZStack {
                NavigationLink {
                    SignUpView(viewModel: SignUpViewModel())
                } label: {
                    Text("Sign up")
                }
                
                //                NavigationLink(
                //                    destination: Text("Tela de cadastro"),
                //                    tag: 1,
                //                    selection: $action,
                //                    label: {EmptyView() })
                
                //                Button("Realize seu cadastro") {
                //                    self.action = 1
                //                }
                
            }
        }
    }
}


#Preview {
    SignInView(viewModel: SignInViewModel())
}



