  //
  //  AddExpenseView.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-27.
  //

import SwiftUI

struct AddExpenseView: View {
  
  @State private var expense: String = ""
  @State private var date: Date = Date()
  @State private var description: String = ""
  
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Amount", text: $expense)
          .keyboardType(.numbersAndPunctuation)
        DatePicker("Date", selection: $date, displayedComponents: .date)
        TextField("Description", text: $description, axis: .vertical)
        
        Section {
          Button("Save") {
            dismiss()
          }
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
      }
      .navigationTitle(Text("Add a expense"))
    }
  }
}

struct AddExpenseView_Previews: PreviewProvider {
  static var previews: some View {
    AddExpenseView()
  }
}
