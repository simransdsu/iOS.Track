  //
  //  AuthView.ViewModel.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-26.
  //

import SwiftUI
import FirebaseAuth

public class AuthService: ObservableObject {
  
    // MARK: Publuc Published properties
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var authType: AuthType = .login
  @Published var appError: AppError? = nil {
    didSet {
      hasError = appError != nil
    }
  }
  @Published var hasError: Bool = false
  @Published var isUserLogged: Bool = Auth.auth().currentUser != nil
  
    // MARK: Private state
  private var _isUserLoggedIn: Bool = Auth.auth().currentUser != nil {
    didSet {
      DispatchQueue.main.async { self.isUserLogged = self._isUserLoggedIn }
    }
  }
  
    // MARK: Public Properties
  var loggedInUserEmail: String? { auth.currentUser?.email }
  var authenticationButtonTitle: String { authType == .signUp ? "Sign Up" : "Log In" }
  var emailPlaceHolder: String { "Email" }
  var passwordPlaceHolder: String { "Password" }
  
    // MARK: External Dependencies
  private let auth = Auth.auth()
  private let validator = UserValidator()
  
  
    // MARK: Public methods
  @MainActor
  func authenticate() {
    Task {
      await self.signupOrLogin()
    }
  }
  
  
  func logout() {
    try? Auth.auth().signOut()
    _isUserLoggedIn = auth.currentUser != nil
  }
  
    // MARK: Private methods
  private func signupOrLogin() async {
    do {
      try validator.validateEmailAndPassword(email: email, password: password)
      if authType == .signUp {
        try await signUp()
      } else if authType == .login {
        try await login()
      }
    } catch {
      let err = (error as? AppError)
      appError = AppError(message: err?.message ?? "Failed to authenticate, please try again.",
                          description: err?.description ?? error.localizedDescription)
    }
  }
  
  
  private func login() async throws {
    let _ = try await auth.signIn(withEmail: email, password: password)
    _isUserLoggedIn = auth.currentUser != nil
  }
  
  
  private func signUp() async throws {
    let _ = try await auth.createUser(withEmail: email, password: password)
    _isUserLoggedIn = auth.currentUser != nil
  }
}

