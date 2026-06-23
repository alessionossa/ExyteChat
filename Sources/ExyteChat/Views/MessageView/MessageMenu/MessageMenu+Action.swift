//
//  MessageMenu+Action.swift
//  Chat
//

import SwiftUI

public protocol MessageMenuAction: Equatable, CaseIterable {
    func title() -> String
    func icon() -> Image
    
    static func menuItems(for message: Message) -> [Self]
}

extension MessageMenuAction {
    public static func menuItems(for message: Message) -> [Self] {
        Self.allCases.map { $0 }
    }
}

public enum DefaultMessageMenuAction: MessageMenuAction, Sendable {

    case copy

    public func title() -> String {
        switch self {
        case .copy:
            "Copy"
        }
    }

    public func icon() -> Image {
        switch self {
        case .copy:
            Image(systemName: "doc.on.doc")
        }
    }

    public static let allCases: [DefaultMessageMenuAction] = [
        .copy
    ]
    
    static public func menuItems(for message: Message) -> [DefaultMessageMenuAction] {
        if message.user.isCurrentUser {
            return allCases
        } else {
            return [.copy]
        }
    }
}
