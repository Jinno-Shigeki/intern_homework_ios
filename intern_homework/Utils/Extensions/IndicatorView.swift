//
//  IndicatorView.swift
//  intern_homework
//
//  Created by 神野成紀 on 2020/08/11.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    func indicatorCustom(view: UIView) {
        self.hidesWhenStopped = true
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.center = view.center
        self.layer.cornerRadius = 10
        self.backgroundColor = .gray
        self.style = .whiteLarge
        view.addSubview(self)
    }
}
