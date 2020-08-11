//
//  TextField.swift
//  intern_homework
//
//  Created by 神野成紀 on 2020/08/11.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

extension UITextField {
    func toolBarCustom(view: UIView) {
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        let okButton = UIBarButtonItem(title: "完了", style: UIBarButtonItem.Style.done, target: self, action: #selector(tapOkButton))
        let barSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([barSpace, okButton], animated: true)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapOkButton() {
        self.endEditing(true)
    }
}
