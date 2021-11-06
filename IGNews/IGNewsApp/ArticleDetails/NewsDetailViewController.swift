//
//  NewsDetailViewController.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var newsHeader: UILabel!
    @IBOutlet weak var newsPicture: UIImageView!
    @IBOutlet weak var newsInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateUI(article: Article){
        newsHeader.text = article.title
        newsPicture.loadImageUsingCache(withUrl: article.headlineImageUrl, placeHolder: UIImage.init(named: "placeHolder"))
        newsInfo.text = article.description
    }

}
