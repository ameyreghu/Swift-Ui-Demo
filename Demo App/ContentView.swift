//
//  ContentView.swift
//  Demo App
//
//  Created by Amey Reghu on 24/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = PostViewModel()
    
    
    var body: some View {
        NavigationView{
            
            Group{
                if viewModel.isLoading{
                    ProgressView("Loading Posts...")
                }else if let error = viewModel.errorMessage{
                    VStack{
                        Text(error).foregroundColor(.red).padding()
                        Button("Rrtry"){
                            Task{
                                await viewModel.fetchPosts()
                            }
                        }.padding()
                    }
                }else{
                    List(viewModel.posts){post in
                        NavigationLink(destination: PostDetailView(post: post)){
                            VStack(alignment: .leading,spacing: 4){
                                Text(post.title.capitalized).font(.headline)
                                Text(post.body).font(.subheadline).foregroundColor(.secondary)
                            }.padding(.vertical,4)
                        }
                    }
                }
            }.navigationTitle("Posts")
        }.task {
            await viewModel.fetchPosts()
        }
    }
}

