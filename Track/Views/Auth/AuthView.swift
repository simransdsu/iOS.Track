  //
  //  AuthView.swift
  //  Track
  //
  //  Created by Simran Preet Singh Narang on 2022-06-25.
  //

import SwiftUI


struct AuthView: View {
  
  @StateObject private var viewModel: AuthView.ViewModel = AuthView.ViewModel()
  
  var body: some View {
    VStack {
      
      Spacers()
      SignupLoginSegmentedControl(authType: $viewModel.authType)
      RoundedTextField(placeHolder: viewModel.emailPlaceHolder, text: $viewModel.email)
        .padding(.top, 20)
      RoundedSecureField(placeHolder: viewModel.passwordPlaceHolder, text: $viewModel.password)
        .padding(.top, 10)
      RoundedButton(action: { viewModel.authenticate() }, title: viewModel.authenticationButtonTitle)
        .padding(.top, 36)
      Spacers(3)
      
    }
    .padding()
    .alert("Error!", isPresented: $viewModel.hasError, actions: {
      Button(role: .cancel, action: {}) {
        Text("OK")
      }
    }, message: {
      Text(viewModel.appError?.message ?? "")
    })
    
  }
}


struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
  }
}



