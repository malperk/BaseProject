//
//  Single+ResponseExtension.swift
//  AnimeApp
//
//  Created by Alper KARATAŞ on 05/10/2017.
//  Copyright © 2017 Alper KARATAŞ. All rights reserved.
//

import RxSwift
import Moya

/// Extension for processing raw NSData generated by network access.
extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    /// Maps data received from the signal into a object. If the conversion fails, the signal errors.
    public func mapJSONObject<T: Codable>(type: T.Type) -> Single<T> {
        return flatMap {return Single.just(try $0.mapJSONObject(type: type))}
    }
}
