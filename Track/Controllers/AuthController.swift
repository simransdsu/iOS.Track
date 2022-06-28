  //
  //  AuthController.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-26.
  //

import SwiftUI

public class AuthController: ObservableObject {
  
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
  @Published var isUserLogged: Bool = false
  
    // MARK: Public Properties
  var authenticationButtonTitle: String { authType == .signUp ? "Sign Up" : "Log In" }
  var emailPlaceHolder: String { "Email" }
  var passwordPlaceHolder: String { "Password" }
  
    // MARK: External Dependencies
  private let validator: UserValidator
  private let authService: AuthService
  
  
  // MARK: Initializer
  init(authService: AuthService = AuthService(),
       validator: UserValidator = UserValidator()) {
    self.authService = authService
    self.validator = validator
    isUserLogged = authService.isUserLoggedIn()
  }
  
    // MARK: Public methods
  @MainActor
  func authenticate() {
    Task {
      await self.signupOrLogin()
    }
  }
  
  @MainActor
  func logout() {
    isUserLogged = authService.logout()
  }
  
  
  func loggedInUserEmail() -> String? {
    authService.loggedInUserEmail()
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
  
  @MainActor
  private func login() async throws {
    isUserLogged = try await authService.login(email: email, password: password)
  }
  
  @MainActor
  private func signUp() async throws {
    isUserLogged = try await authService.signUp(email: email, password: password)
  }
}
