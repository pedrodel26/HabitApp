//
//  SignInViewRouter.swift
//  Habit
//
//  Created by Pedro Delmondes  on 27/03/2024.
//

import SwiftUI
import Combine

enum SignInViewRouter {
  
  static func makeHomeView() -> some View {
    let viewModel = HomeViewModel()
    return HomeView(viewModel: viewModel)
  }
  
  static func makeSignUpView(publisher: PassthroughSubject<Bool, Never>) -> some View {
    let viewModel = SignUpViewModel()
    viewModel.publisher = publisher
    return SignUpView(viewModel: viewModel)
  }
  
}
