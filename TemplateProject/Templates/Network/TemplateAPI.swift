//
//  TemplateAPI.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 20/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import Foundation
import Moya

let templateAPIProvider = MoyaProvider<TemplateAPI>()

public enum TemplateAPI {
    case get(parameters: String?)
    case post(id: String?)
    case stream(num: Int)
    case createUser(firstName: String, lastName: String)
    case updateUser(id: Int, firstName: String, lastName: String)
}

extension TemplateAPI: TargetType {
    
    public var baseURL: URL { return URL(string: "https://httpbin.org")! }
    public var path: String {
        switch self {
        case .get:
            return "/get"
        case .post:
            return "/post"
        case .stream(let num):
            return "/stream/" + num.description
        case .createUser(_, _), .updateUser(_,_, _):
            return "/users/"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .get, .stream:
            return .get
        case .post,.updateUser,.createUser:
            return .post
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case let .updateUser(_, firstName, lastName):
            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
        case let .createUser(firstName, lastName):
            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
        
    }

    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
