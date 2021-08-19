//
//  Hi_ChatApp.swift
//  Hi Chat
//
//  Created by akhmad khalif on 13/08/21.
//

import SwiftUI
import Firebase

@main
struct Hi_ChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
//    init() {
//        FirebaseApp.configure()
//    }
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
