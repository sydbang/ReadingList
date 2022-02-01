//
//  GenreView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import SwiftUI

struct GenreView: View {
    
    @EnvironmentObject var model: BookModel
    
    @State var newGenre: String : ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("New Genre", text: $newGenre)
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                Button {
                    // TBD add new genre
                } label: {
                    Text("Add New Genre")
                        .padding(.bottom, 50)
                }
                
                // Check for blank Genre list
                
                
            }
        }
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView()
    }
}
