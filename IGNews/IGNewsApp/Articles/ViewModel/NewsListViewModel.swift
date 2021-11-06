//
//  NewsListViewModel.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import Foundation

class NewsListViewModel {
    private var articles: [Articles]?
    /// Returns type of articles
    var numberOfSections: Int {
        return articles?.count ?? 0
    }
    
    /// Returns Number of Rows avaialable in Section
    /// - Parameter section: Section
    /// - Returns:Number of Rows
    func numberOfRows(_ section: Int) -> Int {
        return articles?.object(at: section)?.articleList.count ?? 0
    }
    
    /// Retruns Title for Section
    /// - Parameter section: Section
    /// - Returns: Article Title
    func titleForSection(_ section: Int) -> String {
        return articles?.object(at: section)?.title ?? ""
    }
    
    /// Returns Article from List
    /// - Parameter indexPath: indexPath
    /// - Returns: Article
    func article(at indexPath : IndexPath) -> Article? {
        guard let articlesList = articles?.object(at: indexPath.section)?.articleList else { return nil }
        return articlesList.object(at: indexPath.row)
    }
    
    /// Fetches data from server
    /// - Parameter completion: Retuns completion handler either with data or error
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
        if let topNews = articleList.topNews, topNews.count > 0 {
            articles.append(Articles(title: Constants.ArticleTitles.topNews, articleList: topNews))
        }
        if let technicalAnalysis = articleList.technicalAnalysis, technicalAnalysis.count > 0 {
            articles.append(Articles(title: Constants.ArticleTitles.technicalAnalysis, articleList: technicalAnalysis))
        }
        if let specialReport = articleList.specialReport, specialReport.count > 0 {
            articles.append(Articles(title: Constants.ArticleTitles.specialReport, articleList: specialReport))
        }
        
        
        self.articles = articles
    }
    
    
}
