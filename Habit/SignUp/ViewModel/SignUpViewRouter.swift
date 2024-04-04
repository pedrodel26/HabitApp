//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by Pedro Delmondes  on 31/03/2024.
//

import SwiftUI

enum SignUpViewRouter {
  
  static func makeHomeView() -> some View {
    let viewModel = HomeViewModel()
    return HomeView(viewModel: viewModel)
  }
}

