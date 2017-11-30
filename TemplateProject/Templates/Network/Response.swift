//
//  Response.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 20/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import Foundation

class Headers:Codable {
    let host:String
    let cookie:String
    let userAgent:String
    let acceptEncoding:String
    
    
    enum CodingKeys: String, CodingKey {
        case host = "Host"
        case cookie = "Cookie"
        case userAgent = "User-Agent"
        case acceptEncoding = "Accept-Encoding"
    }
    
}
    
class BasicResponse:Codable {
    let url:String
    let id:String
    let origin:String
    let headers:Headers
}
