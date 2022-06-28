//
//  AuthService.swift
//  Track
//
//  Created by Simran Preet Narang on 2022-06-28.
//

import Foundation
import FirebaseAuth

class AuthService {
  
  private let auth = Auth.auth()
  private let validator = UserValidator()
  
  func signUp(email: String, password: String) async throws -> Bool {
    let result = try await auth.createUser(withEmail: email, password: password)
    return result.user.email != nil
  }
  
  func login(email: String, password: String) async throws -> Bool {
    let result = try await auth.signIn(withEmail: email, password: password)
    return result.user.email != nil
  }
  
  func logout() -> Bool {
    guard let _ = try? auth.signOut() else {
      return true
    }
    return false
  }
  
  func loggedInUserEmail() -> String? {
    return auth.currentUser?.email
  }
  
  func isUserLoggedIn() -> Bool {
    return loggedInUserEmail() != nil
  }
}
