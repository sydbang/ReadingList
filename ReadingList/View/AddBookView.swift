//
//  AddBookView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import SwiftUI

struct AddBookView: View {
    
    @EnvironmentObject var model: BookModel
    
    @State var bookTitle: String = ""
    @State var bookAuthor: String = ""
    @State var bookPages: String = ""
    @State var selectedRating: Int = 0
    @State var selectedStatus: Int = 0
    @State var selectedGenre: Int = 0
    
    var body: some View {
        
        VStack {
            ScrollView() {
                TextField("Book Title", text: $bookTitle)
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                TextField("Book Author", text: $bookAuthor)
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                TextField("Number of Pages", text: $bookPages)
                    // Filter the input for only numbers
                    .keyboardType(.numberPad)
                    
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                
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
                    // TDB action to submit book
                    
                } label: {
                    Text("Submit Book")
                }
                
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
