//
//  BarShape.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 16..
//

import Foundation
import SwiftUI

struct BarShape : Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.maxX * 0.1, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX * 0.9, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX * 0.1, y: rect.minY))
        }
    }
}
