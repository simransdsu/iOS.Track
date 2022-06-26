  //
  //  SignupLoginSegmentedControl.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-26.
  //

import SwiftUI

struct SignupLoginSegmentedControl: View {
  
  @Binding var authType: AuthType
  
  var body: some View {
    
    Picker("", selection: $authType) {
      Text("Sign Up").tag(AuthType.signUp)
      Text("Log In").tag(AuthType.login)
    }
    .pickerStyle(.segmented)
    
  }
}

struct SignupLoginSegmentedControl_Previews: PreviewProvider {
  static var previews: some View {
    SignupLoginSegmentedControl(authType: .constant(.login))
  }
}
