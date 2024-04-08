//
//  SignInView.swift
//  Habit
//
//  Created by Pedro Delmondes  on 25/03/2024.
//

import SwiftUI

struct SignInView: View {
  
  @ObservedObject var viewModel: SignInViewModel
    
  @State var action: Int? = 0
  
  @State var navigationHidden = true
  
  var body: some View {
    ZStack {
      if case SignInUIState.goToHomeScreen = viewModel.uiState {
        viewModel.homeView()
      } else {
        NavigationView {
          
          ScrollView(showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
              
              Spacer(minLength: 36)
              
              VStack(alignment: .center, spacing: 8) {
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .padding(.horizontal, 48)
                
                Text("Login")
                  .foregroundColor(.orange)
                  .font(Font.system(.title).bold())
                  .padding(.bottom, 8)
                
                emailField
                
                passwordField
                
                enterButton
                
                registerLink
                
                Text("Copyright - PDIT 2024")
                  .foregroundColor(Color.gray)
                  .font(Font.system(size: 12).bold())
                  .padding(.top, 16)
              }
              
            }
            
            if case SignInUIState.error(let value) = viewModel.uiState {
              Text("")
                .alert(isPresented: .constant(true)) {
                  Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
                    // faz algo quando some o alerta
                  })
                }
            }
            
          }
          .frame(maxWidth:.infinity, maxHeight: .infinity)
          .padding(.horizontal, 32)
          .navigationBarTitle("Login", displayMode: .inline)
          .navigationBarHidden(navigationHidden)
        }
        .onAppear {
          self.navigationHidden = true
        }
        .onDisappear {
          self.navigationHidden = false
        }
      }
    }
  }
  
}

extension SignInView {
  var emailField: some View {
//    TextField("", text: $email)
//      .border(Color.orange)
      EditTextView(text: $viewModel.email,
                   placeholder: "E-mail",
                   keyboard: .emailAddress,
                   error: "E-mail Inválido",
                   failure: !viewModel.email.isEmail())
  }
}

extension SignInView {
  var passwordField: some View {
      EditTextView(text: $viewModel.password,
                   placeholder: "Senha",
                   keyboard: .emailAddress,
                   error: "Senha deve conter ao menos 8 caracteres",
                   failure: viewModel.password.count < 8,
                   isSecure: true)
      
  }
}

extension SignInView {
  var enterButton: some View {
      LoadingButtonView(action: {
          viewModel.login()
      }, 
                        text: "Entrar",
                        showProgress: self.viewModel.uiState == SignInUIState.loading,
                        disabled: !viewModel.email.isEmail() || viewModel.password.count < 8)
  }
}

extension SignInView {
  var registerLink: some View {
    VStack {
      Text("Ainda não possui um login ativo?")
        .foregroundColor(.gray)
        .padding(.top, 48)
      
      ZStack {
        NavigationLink(
          destination: viewModel.signUpView(),
          tag: 1,
          selection: $action,
          label: { EmptyView() })
        
        Button("Realize seu Cadastro") {
          self.action = 1
        }
      }
      
    }
  }
}

#Preview {
    SignInView(viewModel: SignInViewModel())    
}



