//
//  Post.swift
//  Demo App
//
//  Created by Amey Reghu on 24/08/25.
//

import Foundation

struct Post: Identifiable,Codable {
    let id:Int
    let title:String
    let body:String
}
