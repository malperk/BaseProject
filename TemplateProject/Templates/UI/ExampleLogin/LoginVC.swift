//
//  LoginVC.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 30/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import UIKit
import RxSwift

class LoginVC: BaseVC {
    let viewModel = LoginVM()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBAction func btnLoginClick(_ sender: Any) {
//        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle:.alert)
//        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func bindUI(){
        let username = tfName.rx.text.orEmpty.asObservable()
        let password = tfPassword.rx.text.orEmpty.asObservable()
        
        viewModel.confirmButtonValid(username: username, password: password)
            .bind(to: btnLogin.rx.isEnabled)
            .disposed(by: disposeBag)
        
        self.tfName.rx.text.orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        
        self.tfPassword.rx.text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
    }
}
