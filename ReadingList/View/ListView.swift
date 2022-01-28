//
//  ListView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddBookView(),
                    label: {
                        Text("Add book")
                })

            }
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
