  //
  //  AuthView.swift
  //  Track
  //
  //  Created by Simran Preet Singh Narang on 2022-06-25.
  //

import SwiftUI

enum AuthType: Int {
  case signUp = 0
  case login = 1
}

struct AuthView: View {
  
  @StateObject private var viewModel: AuthView.ViewModel = AuthView.ViewModel()
  
  var body: some View {
    VStack {
      Picker("Select", selection: $viewModel.authType) {
        Text("Sign Up").tag(AuthType.signUp)
        Text("Log In").tag(AuthType.login)
      }
      .pickerStyle(.segmented)
      
      RoundedTextField(placeHolder: "Email", text: $viewModel.email)
      RoundedSecureTextField(placeHolder: "Password", text: $viewModel.password)
      RoundedButton(action: viewModel.authenticate, title: viewModel.authType == .signUp ? "Sign up" : "Log In")
    }
    .padding()
  }
}


struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
  }
}
