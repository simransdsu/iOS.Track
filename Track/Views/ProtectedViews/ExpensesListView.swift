  //
  //  ExpensesListView.swift
  //  Track
  //
  //  Created by Simran Preet Singh Narang on 2022-06-26.
  //

import SwiftUI
import FirebaseAuth

struct ExpensesListView: View {
  
  @EnvironmentObject private var authService: AuthController
  
  @State private var showAddExpenseView: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack {
        Text("\(authService.loggedInUserEmail() ?? "No email found.")")
      }
      .navigationTitle(Text("Track"))
      .toolbar {
        logoutButton
        addExpenseButton
      }
      .sheet(isPresented: $showAddExpenseView, content: addExpenseView)
    }
  }
  
  // MARK: UI Properties
  private var logoutButton: some ToolbarContent {
    ToolbarItem(placement: .navigationBarLeading) {
      Button {
        authService.logout()
      } label: {
        Text("Logout")
      }
    }
  }
  
  private var addExpenseButton: some ToolbarContent {
    ToolbarItem(placement: .navigationBarTrailing) {
      Button {
        showAddExpenseView.toggle()
      } label: {
        Image(systemName: "plus.circle")
      }
    }
  }
  
  // MARK: Private Helper methods
  private func addExpenseView() -> AddExpenseView {
    return AddExpenseView()
  }
}

struct ExpensesListView_Previews: PreviewProvider {
  static var previews: some View {
    ExpensesListView()
  }
}
