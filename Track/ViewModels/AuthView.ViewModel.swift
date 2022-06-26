//
//  AuthView.ViewModel.swift
//  Track
//
//  Created by Simran Preet Narang on 2022-06-26.
//

import SwiftUI


extension AuthView {
  public class ViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var authType: AuthType = .signUp
    
    var authenticationButtonTitle: String { authType == .signUp ? "Sign Up" : "Log In" }
    var emailPlaceHolder: String { "Email" }
    var passwordPlaceHolder: String { "Password" }
    
    func authenticate() {
      if authType == .signUp {
        print("Sign Up")
      } else if authType == .login {
        print("Log In")
      }
    }
  }
}
