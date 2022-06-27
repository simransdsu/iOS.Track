//
//  ExpenseValidator.swift
//  Track
//
//  Created by Simran Preet Narang on 2022-06-27.
//

import Foundation

struct ExpenseValidator {
  
  func validate(expense: Expense) throws {
    if expense.expense.isLess(than: 0) {
      throw AppError(message: "Expense cannot be less than zero.")
    }
    
    // TODO: Thing something about date validation.
  }
}
