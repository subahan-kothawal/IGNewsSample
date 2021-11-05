//
//  NewsListViewModel.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

class NewsListViewModel {
    var articles: [Articles]?
    var numberOfSections: Int {
        return articles?.count ?? 0
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return articles?.object(at: section)?.articleList.count ?? 0
    }
    
    func titleForSection(_ section: Int) -> String {
        return articles?.object(at: section)?.title ?? ""
    }
    
    func fetchData(completion: @escaping ((_ error : Error?) -> Void)) {
        NetworkManager.shared().startService(service: ArticleListService(), reponseObject: {[weak self] error, response in
            guard error == nil else {
                completion(error)
                return
            }
            let data = response?.data as? ArticleList
            self?.updateData(articleList: data)
            completion(nil)
        })
    }
    
    private func updateData(articleList: ArticleList?) {
        guard let articleList = articleList else {
            return
        }
        var articles: [Articles] = []
        if let breakingNews = articleList.breakingNews, breakingNews.count > 0 {
            articles.append(Articles(title: Constants.ArticleTitles.breakingNews, articleList: breakingNews))
        }
//        if let topNews = articleList.breakingNews, breakingNews.count > 0 {
//            articles.append(Articles(title: Constants.ArticleTitles.breakingNews, articleList: breakingNews))
//        }
        
        
        self.articles = articles
    }
    
    
}
