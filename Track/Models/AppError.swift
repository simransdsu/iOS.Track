//
//  AppError.swift
//  Track
//
//  Created by Simran Preet Narang on 2022-06-26.
//

import Foundation

struct AppError: Error {
  let message: String
  let description: String
  
  init(message: String, description: String? = nil) {
    self.message = message
    self.description = description ?? message
    print("❌ \(String(describing: description)) --- \(localizedDescription)")
  }
}
