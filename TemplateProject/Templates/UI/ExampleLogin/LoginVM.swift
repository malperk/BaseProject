//
//  LoginVM.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 30/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import Foundation
import RxSwift

class LoginVM {
    let username = Variable<String>("")
    let password = Variable<String>("")
    
    
    public init(){}
    
    func confirmButtonValid(username: Observable<String>, password: Observable<String>) -> Observable<Bool> {
        return Observable.combineLatest(username, password)
        { (username, password) in
            return username.characters.count > 0
                && password.characters.count > 0
        }
    }
}
