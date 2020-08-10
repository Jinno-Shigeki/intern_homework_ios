//
//  ArticleListCell.swift
//  intern_homework
//
//  Created by 神野成紀 on 2020/08/10.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit
import Nuke

class ArticleListCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(_ article: Article) {
        titleLabel.text = article.title
        discriptionLabel.text = "LGTM: " +  String(article.likesCount)
        if let urlString = article.user?.profileImageUrl,
            let url = URL(string: urlString) {
            Nuke.loadImage(with: url, into: userImageView)
        }
    }
}
