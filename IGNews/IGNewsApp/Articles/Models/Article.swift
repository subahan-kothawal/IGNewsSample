//
//  Article.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

struct Article: Decodable {
    let title: String
    let description: String
    let headlineImageUrl: String
}
