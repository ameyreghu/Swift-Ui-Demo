//
//  PostViewModel.swift
//  Demo App
//
//  Created by Amey Reghu on 24/08/25.
//
import Foundation

@MainActor
class PostViewModel: ObservableObject{
    @Published var posts:[Post]=[]
    @Published var isLoading = false
    @Published var errorMessage:String?=nil
    
    
    func fetchPosts() async{
        isLoading=true
        errorMessage=nil
        
        let url = URL(string:"https://jsonplaceholder.typicode.com/posts")!
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodePosts = try JSONDecoder().decode([Post].self,from: data)
            self.posts=decodePosts
        }catch{
            errorMessage="Faildeed to load posts: \(error.localizedDescription)"
        }
        isLoading = false
        
    }
    
}
