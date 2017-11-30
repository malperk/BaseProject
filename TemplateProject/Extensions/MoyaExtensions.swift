//
//  MoyaExtensions.swift
//  TemplateProject
//
//  Created by Alper KARATAŞ on 20/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import Moya

public extension Response {
    /// Maps data received from the signal into a object.
    func mapJSONObject<T: Codable>(type: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }
}
