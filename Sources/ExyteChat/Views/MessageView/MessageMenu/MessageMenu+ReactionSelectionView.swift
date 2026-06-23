//
//  ReactionSelectionView.swift
//  Chat
//

import SwiftUI

extension AnyTransition {
    static var scaleAndFade: AnyTransition {
        .scale.combined(with: .opacity)
    }
}
