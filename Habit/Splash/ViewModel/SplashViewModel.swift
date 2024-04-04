//
//  SplashViewMode.swift
//  Habit
//
//  Created by Pedro Delmondes  on 24/03/2024.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.uiState = .error("Erro no processamento de dados!")
            self.uiState = .goToSignInScreen
        }
    }
}

extension SplashViewModel {
    func SignInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
