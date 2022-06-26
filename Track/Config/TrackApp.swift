//
//  TrackApp.swift
//  Track
//
//  Created by Simran Preet Singh Narang on 2022-06-25.
//

import SwiftUI
import FirebaseCore


@main
struct TrackApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    
    return true
  }
}
