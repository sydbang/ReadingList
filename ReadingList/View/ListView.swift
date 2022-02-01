//
//  ListView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddBookView(),
                    label: {
                        Text("Add book")
                            .padding(.horizontal, 10)
                })
                
                // Check if list of genres/books exist
                if model.genres.count == 0 {
                    Text("No genres/books found")
                } else {
                    List {
                        ForEach(model.genres, id: \.self) { genre in
                            GenreSelectedView(genre: genre)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
