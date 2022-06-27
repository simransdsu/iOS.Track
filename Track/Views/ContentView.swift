  //
  //  ContentView.swift
  //  Track
  //
  //  Created by Simran Preet Singh Narang on 2022-06-25.
  //

import SwiftUI

struct ContentView: View {
  
  @StateObject var authservice = AuthService()
  
  var body: some View {
    VStack {
      if authservice.isUserLogged {
        ExpensesListView()
          .environmentObject(authservice)
      } else {
        AuthView()
          .environmentObject(authservice)
      }
        
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
