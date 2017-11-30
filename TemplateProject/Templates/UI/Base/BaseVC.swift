//
//  BaseVC.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 30/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.bindUI()
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func bindUI(){
    }
}
