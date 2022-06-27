  //
  //  AuthView.swift
  //  Track
  //
  //  Created by Simran Preet Singh Narang on 2022-06-25.
  //

import SwiftUI


struct AuthView: View {
  
  @EnvironmentObject private var authService: AuthService
  
  var body: some View {
    VStack {
      
      Spacers()
      SignupLoginSegmentedControl(authType: $authService.authType)
      RoundedTextField(placeHolder: authService.emailPlaceHolder, text: $authService.email)
        .padding(.top, 20)
      RoundedSecureField(placeHolder: authService.passwordPlaceHolder, text: $authService.password)
        .padding(.top, 10)
      RoundedButton(action: { authService.authenticate() }, title: authService.authenticationButtonTitle)
        .padding(.top, 36)
      Spacers(3)
      
    }
    .padding()
    .alert("Error!", isPresented: $authService.hasError, actions: {
      Button(role: .cancel, action: {}) {
        Text("OK")
      }
    }, message: {
      Text(authService.appError?.message ?? "")
    })
    
  }
}


struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
  }
}



