//
//  ReadingListApp.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-26.
//

import SwiftUI
import Firebase

@main
struct ReadingListApp: App {
    
    init() {
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BookModel())
        }
    }
}
