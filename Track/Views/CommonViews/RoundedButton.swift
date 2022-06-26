  //
  //  RoundedButton.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-26.
  //

import SwiftUI

struct RoundedButton: View {
  
  var action: () -> Void
  var title: String
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, minHeight: 44)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
  }
}

struct RoundedButton_Previews: PreviewProvider {
  static var previews: some View {
    RoundedButton(action: {}, title: "Login")
  }
}
