//
//  Post.swift
//  NewsAppRX
//
//  Created by Yadilsa Diaz on 9/26/21.
//

import Foundation




struct Feed: Decodable {
    let articles: [Post]
}


struct Post: Decodable {
    let title: String
    let author: String?
}
