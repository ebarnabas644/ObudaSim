//
//  Util.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 22..
//

import Foundation

class Util{
    public static func Clamp<T>(value : T, range : Range<T>) -> T{
        return min(range.upperBound, max(range.lowerBound, value))
    }
}
