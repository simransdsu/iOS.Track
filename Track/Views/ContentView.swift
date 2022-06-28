  //
  //  ContentView.swift
  //  Track
  //
  //  Created by Simran Preet Singh Narang on 2022-06-25.
  //

import SwiftUI

struct ContentView: View {
  
//  @StateObject var userService: UserService
  @StateObject var authController: AuthController
  
  init() {
//    _userService = StateObject(wrappedValue: UserService())
    _authController = StateObject(wrappedValue: AuthController())
  }
  
  var body: some View {
    VStack {
      if authController.isUserLogged {
        ExpensesListView()
          .environmentObject(authController)
      } else {
        AuthView()
          .environmentObject(authController)
      }
        
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
