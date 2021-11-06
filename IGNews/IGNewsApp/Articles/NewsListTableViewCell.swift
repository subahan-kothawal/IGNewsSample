//
//  NewsListTableViewCell.swift
//  IGNews
//
//  Created by subahan on 06/11/21.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func updateNewsDetailToCell(article: Article? ){
        guard let article = article else {
            return
        }
        newsTitle.text = article.title
        newsDescription.text = article.description
        newsImage.loadImageUsingCache(withUrl: article.headlineImageUrl, placeHolder: UIImage.init(named: "placeHolder"))
    }
}
