  //
  //  RoundedSecureField.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-25.
  //

import SwiftUI

struct RoundedSecureField: View {
  
  var placeHolder: String
  @Binding var text: String
  
  var body: some View {
    SecureField(placeHolder, text: $text)
      .frame(minHeight: 44)
      .padding([.horizontal], 4)
      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
  }
}

struct RoundedSecureTextField_Previews: PreviewProvider {
  static var previews: some View {
    RoundedSecureField(placeHolder: "Password", text: .constant("Password"))
  }
}
