//
//  SignInViewModel.swift
//  Habit
//
//  Created by Pedro Delmondes  on 25/03/2024.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
  
  private var cancellable: AnyCancellable?
  
  private let publisher = PassthroughSubject<Bool, Never>()
  
  @Published var uiState: SignInUIState = .none
  
  init() {
    cancellable = publisher.sink { value in
      print("usuário criado! goToHome: \(value)")
      
      if value {
        self.uiState = .goToHomeScreen
      }
    }
  }
  
  deinit {
    cancellable?.cancel()
  }
  
  func login() {
    self.uiState = .loading
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.uiState = .goToHomeScreen
    }
  }
  
}

extension SignInViewModel {
  func homeView() -> some View {
    return SignInViewRouter.makeHomeView()
  }
  func signUpView() -> some View {
    return SignInViewRouter.makeSignUpView(publisher: publisher)
  }
}





