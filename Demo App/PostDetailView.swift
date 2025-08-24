//
//  PostDetailView.swift
//  Demo App
//
//  Created by Amey Reghu on 24/08/25.
//

import SwiftUI

struct PostDetailView: View {
    let post:Post
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 16){
                Text(post.title.capitalized).font(.title).bold()
                
                Text(post.body).font(.body).foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("Post #\(post.id)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

