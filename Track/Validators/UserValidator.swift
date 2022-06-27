//
//  EmailPasswordValidator.swift
//  Track
//
//  Created by Simran Preet Singh Narang on 2022-06-26.
//

import Foundation

struct UserValidator {
  
  func validateEmailAndPassword(email: String, password: String) throws {
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
