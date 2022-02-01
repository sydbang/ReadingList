//
//  GenreView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import SwiftUI

struct GenreView: View {
    
    @EnvironmentObject var model: BookModel
    
    @State var newGenre: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("New Genre", text: $newGenre)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
                    .padding(.vertical, 10)
                Button {
                    if newGenre != "" {
                        model.addGenre(newGenre: newGenre)
                        
                        // Fetch new genre data from database
                        model.getGenres()
                        newGenre = ""
                    }
                } label: {
                    Text("Add New Genre")
                        .padding(.bottom, 50)
                }
                
                // Check for blank Genre list
                if model.genres.count == 0 {
                    Text("No genres found. Add a genre to get started!")
                } else {
                    ScrollView {
                        // Display genre with tappable navigation to view all books in given genre
                        ForEach (model.genres, id: \.self) { genre in
                            NavigationLink (destination: GenreSelectedView(genre: genre)) {
                                Text(genre)
                            }
                            
                        }
                    }
                }
                
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView()
    }
}
