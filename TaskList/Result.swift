//
//  Result.swift
//  TaskList
//
//  Created by Исрапил Гусиев on 08.12.17.
//  Copyright © 2017 Israpil Gusiev. All rights reserved.
//

import Foundation

struct CoreError: Error {
    var localizedDescription: String {
        return message
    }
    
    var message = ""
}


enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}
