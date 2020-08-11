//
//  ArticleLisetViewController.swift
//  intern_homework
//
//  Created by 神野成紀 on 2020/08/10.
//  Copyright © 2020 caraquri. All rights reserved.
//
import SafariServices
import UIKit

class ArticleListViewController: UIViewController {

    @IBOutlet private weak var articleTableView: UITableView!
    private var article: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleTableView.register(R.nib.articleListCell)
        articleTableView.reloadData()
        articleTableView.delegate = self
        articleTableView.dataSource = self
    }
    
    static func makeInstance(_ article: [Article]) -> ArticleListViewController {
        let articleListViewController = R.storyboard.articleList.instantiateInitialViewController()!
        articleListViewController.article = article
        return articleListViewController
    }
}
//MARK: - UITableViewDelegate
extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlString = article[safe: indexPath.row]?.url,
            let url = URL(string: urlString) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
//MARK: - UITableViewDataSource
extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.articleCell, for: indexPath),
            let article = article[safe: indexPath.row] else { return UITableViewCell() }
        cell.set(article)
        return cell
    }
}
