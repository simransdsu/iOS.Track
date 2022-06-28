  //
  //  ExpenseController.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-27.
  //

import Foundation
import FirebaseFirestore
import FirebaseAuth


class ExpenseController: ObservableObject {
  
  @Published var expense: String = ""
  @Published var date: Date = Date()
  @Published var description: String = ""
  @Published var appError: AppError? = nil {
    didSet {
      hasError = appError != nil
    }
  }
  @Published var hasError: Bool = false
  
    // MARK: External dependencies
  let expenseValidator = ExpenseValidator()
  let db = Firestore.firestore()
  let auth = Auth.auth()
  
  func addExpense() throws {
    let expense = Expense(expense: Double(expense) ?? 0.0, date: date, description: description)
    
    do {
      try expenseValidator.validate(expense: expense)
      
    } catch {
      let err = (error as? AppError)
      appError = AppError(message: err?.message ?? "Failed to authenticate, please try again.",
                          description: err?.description ?? error.localizedDescription)
    }
  }
}

