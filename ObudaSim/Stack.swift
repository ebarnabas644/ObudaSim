//
//  Stack.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 17..
//

import Foundation

struct Stack<T> {
    private var data : [T] = []
    
    func pop() -> T {
        return data.removeFirst()
    }
}
