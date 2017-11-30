//
//  MVWithStoryboard.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 20/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import RxSwift

class MVWithStoryboard {
    private let disposeBag = DisposeBag()
    
    var data: Single<[BasicResponse]> = {
        return templateAPIProvider
            .rx.request(.stream(num:10))
            .filter(statusCode: 200)
            .mapJSONObject(type: [BasicResponse].self)
    }()
    
    init() {
    }
}
