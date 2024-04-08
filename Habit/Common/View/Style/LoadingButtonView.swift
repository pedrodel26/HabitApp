//
//  LoadingButtonView.swift
//  Habit
//
//  Created by Pedro Delmondes  on 05/04/2024.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var text: String
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            Button(action: {
                action()
            }, label: {
                Text(showProgress ? "" : text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(.title2)
                    .background(disabled ? Color("lightOrange") : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(35)
            }).disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}

#Preview {
    LoadingButtonView(action: {
        print("ola mundo")
    }, text: "Entrar", showProgress: false, disabled: false)
}
