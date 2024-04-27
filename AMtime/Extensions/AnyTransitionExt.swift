//
//  AnyTransitionExt.swift
//  AMtime
//
//  Created by Sherlock Zhao on 28/4/2024.
//

import SwiftUI

extension AnyTransition {
    static var hearbeat: AnyTransition {
        return AnyTransition.scale(scale: 1.7).combined(with: .scale(scale: 1))
    }
}
