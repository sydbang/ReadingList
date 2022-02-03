//
//  BookDetailView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model: BookModel
    
    var book: Book
    
    @State var selectedRating: Int = 0
    @State var selectedStatus: Int = 0
    @State var selectedGenre: Int = 0
    
    
    var body: some View {
        VStack {
            ScrollView {
                Text(book.title)
                    .font(.headline)
                    .onAppear() {
                        selectedRating = book.rating
                        selectedStatus = model.statuses.firstIndex(of: book.status) ?? 0
                        selectedGenre = model.genres.firstIndex(of: book.genre) ?? 0
                    }
                Text(book.author)
                
                if book.pageNumber != 0 {
                    Text("Pages: \(book.pageNumber)")
                }
                Divider()
                
                VStack {
                    Text("Rating:")
                    
                    Picker(selection: $selectedRating, label: Text(""), content: {
                        ForEach(0..<6) { rating in
                            if (rating == 0) {
                                Text("N/A").tag(rating)
                            } else {
                                Text("\(rating)").tag(rating)
                            }
                            
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Status:")
                    Picker(selection: $selectedStatus, label: Text("")) {
                        ForEach (0..<model.statuses.count) { index in
                            Text(model.statuses[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Genre:")
                    Picker(selection: $selectedGenre, label: Text("")) {
                        ForEach(0..<model.genres.count) { index in
                            Text(model.genres[index])
                        }
                    }
                }
                
                Button {
                    // To do: Save changes
                } label: {
                    Text("Save Change")
                }
                
                Button {
                    model.deleteBook(book: book)
                } label: {
                    Text("Delete Book")
                }
                
                Spacer()
            }
        }
    }
}

