//
//  ContentView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-26.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = Constants.homeTab
    
    var body: some View {
        TabView (selection: $selectedTab) {
            ListView()
                .tabItem{
                    VStack {
                        Image(systemName: "book")
                        Text("All Books")
                    }
                }
                .tag(Constants.homeTab)
            
            SearchView()
                .tabItem{
                    VStack {
                        Image(systemName: "folder")
                        Text("Genres")
                    }
                }
                .tag(Constants.searchTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
