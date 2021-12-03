//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by G. Michael Fortin Jr on 12/3/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
