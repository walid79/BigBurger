//
//  ErrorResult.swift
//  BigBurger
//
//  Created by walid nakbi on 22/7/2021.
//

import Foundation
import Foundation
enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
