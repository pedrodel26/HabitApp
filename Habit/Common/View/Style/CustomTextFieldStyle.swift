//
//  CustomTextFieldStyle.swift
//  Habit
//
//  Created by Pedro Delmondes  on 04/04/2024.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 30.0)
                    .stroke(Color.orange, lineWidth: 0.8))
    }
}
