//
//  NewsListViewController.swift
//  IGNews
//
//  Created by subahan on 05/11/21.
//

import UIKit

class NewsListViewController: UITableViewController {

    let viewModel = NewsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchData { [weak self] error in
            guard error == nil else{
                print("Unable to fetch Newslist failed with error :" , error as Any)
                return
            }
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForSection(section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsListTableViewCell else { return tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) }

        let article = viewModel.article(at: indexPath)
        cell.updateNewsDetailToCell(article: article)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.article(at: indexPath)
        updateNewsDetails(article: article)
    }
    
    private func updateNewsDetails(article: Article?) {
        guard let article = article,
              let navVC = self.splitViewController?.viewControllers.last as? UINavigationController,
        let detailVC = navVC.topViewController as? NewsDetailViewController else { return }
        detailVC.updateUI(article: article)
    }

}
