//
//  SplashViewRouter.swift
//  Habit
//
//  Created by Pedro Delmondes  on 25/03/2024.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
