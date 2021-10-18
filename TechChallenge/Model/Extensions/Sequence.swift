//
//  Array.swift
//  TechChallenge
//
//  Created by Lukasz Dziwosz on 18/10/2021.
//

import Foundation

extension Sequence  {
    func sum<T: AdditiveArithmetic>(_ predicate: (Element) -> T) -> T { reduce(.zero) { $0 + predicate($1) } }
}
