//
//  ArticleListService.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

class ArticleListService: BaseService {
    
    override init() {
        super.init()
        requestUrl = Constants.articlesPath
        parser = GenericParser<ArticleList>()
    }
}
