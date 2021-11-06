//
//  ArticleList.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

struct ArticleList: Decodable {
    let breakingNews: [Article]?
    let topNews: [Article]?
    let technicalAnalysis: [Article]?
    let specialReport: [Article]?
}
