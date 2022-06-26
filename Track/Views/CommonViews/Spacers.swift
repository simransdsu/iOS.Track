  //
  //  Spacers.swift
  //  Track
  //
  //  Created by Simran Preet Narang on 2022-06-26.
  //

import SwiftUI

struct Spacers: View {
  
  var times: Int
  
  init(_ times: Int = 1) {
    self.times = times
  }
  
  var body: some View {
    ForEach(0..<times) { _ in
      Spacer()
    }
  }
}

struct Spacers_Previews: PreviewProvider {
  static var previews: some View {
    Spacers(5)
  }
}
