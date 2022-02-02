//
//  GenreSelectedView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-31.
//

import SwiftUI

struct GenreSelectedView: View {
    
    @EnvironmentObject var model: BookModel
    
    var genre: String
    
    var body: some View {
        
        VStack {
            Text(genre).font(.title2)
            
            
            
            
        }
        
        
    }
}

struct GenreSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectedView(genre: "Fantasy")
    }
}
