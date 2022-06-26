//
//  AuthView.ViewModel.swift
//  Track
//
//  Created by Simran Preet Narang on 2022-06-26.
//

import SwiftUI
import FirebaseAuth

extension AuthView {
  public class ViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var authType: AuthType = .signUp
    
    @Published var appError: AppError? = nil {
      didSet {
        hasError = appError != nil
      }
    }
    @Published var hasError: Bool = false
    
    var authenticationButtonTitle: String { authType == .signUp ? "Sign Up" : "Log In" }
    var emailPlaceHolder: String { "Email" }
    var passwordPlaceHolder: String { "Password" }
    
    @MainActor
    func authenticate() {
      Task {
        do {
          if authType == .signUp {
            try await signUp()
          } else if authType == .login {
            try await login()
          }
        } catch {
          
          appError = AppError(message: (error as? AppError)?.message ?? "Failed to authenticate, please try again.",
                              description: (error as? AppError)?.description ?? error.localizedDescription)
        }
      }
    }
    
    private func login() async throws {
      try validateEmailAndPassword()
      
      let _ = try await Auth.auth().signIn(withEmail: email, password: password)
      
      print("User logged in successfully")
    }
    
    private func signUp() async throws {
      try validateEmailAndPassword()
      
      let _ = try await Auth.auth().createUser(withEmail: email, password: password)
      
      print("User registered successfully")
    }
    
    private func validateEmailAndPassword() throws {
      if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || 
         password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
        throw AppError(message: "Email or Password cannot be empty.")
      }
      
      if !email.isValidEmail() {
        throw AppError(message: "Invalid Email address.")
      }
      
      if password.count < 8 {
        throw AppError(message: "Password should be atleast 8 characters or more.")
      }
    }
  }
}
