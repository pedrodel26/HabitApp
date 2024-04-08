//
//  EditTextView.swift
//  Habit
//
//  Created by Pedro Delmondes  on 04/04/2024.
//

import SwiftUI

struct EditTextView: View {
    
    @Binding var text: String
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    
    var body: some View {

        TextField(placeholder, text: $text)
            .foregroundColor(Color("textColor"))
            .keyboardType(keyboard)
            .textFieldStyle(CustomTextFieldStyle())
        
        
        if let error = error, failure == true, !text.isEmpty {
            Text(error).foregroundColor(.red)
        }
    }
}

#Preview {
    EditTextView(text: .constant("pedromodesto26@gmail.com"),
                 placeholder: "E-mail",
                 error: "Campo Inválido",
                 failure: "a@a.com".count < 3)
}
