//
//  SearchViewController.swift
//  intern_homework
//
//  Created by 神野成紀 on 2020/08/10.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {

    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    let activityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.indicatorCustom(view: self.view)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchArticles()
    }
    
    private func searchArticles() {
        guard let searchText = searchTextField.text, !searchText.isEmpty else {
            searchTextField.placeholder = "Please Input Keyword."
            return
        }
        
        searchButton.isEnabled = false
        activityIndicatorView.startAnimating()
        
        APIClient.fetchArticles(keyword: searchText) { [weak self] (result) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                switch result {
                case .success(let articles):
                    self.showArticleListScreen(articles)
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self.present(alert, animated: true)
                }
                self.searchButton.isEnabled = true
            }
        }
    }
    
    private func showArticleListScreen(_ articles: [Article]) {
        let nextViewController = ArticleListViewController.makeInstance(articles)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
