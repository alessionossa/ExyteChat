//
//  Reaction.swift
//  Chat
//

import Foundation

public enum ReactionType: Codable, Equatable, Hashable, Sendable {
    case emoji(String)
    //case sticker(Image / Giphy / Memoji)
    //case other...
    
    var toString: String {
        switch self {
        case .emoji(let emoji):
            return emoji
        }
    }
}

public struct Reaction: Codable, Identifiable, Hashable, Sendable {
    public let id: String
    public let user: User
    public let createdAt: Date
    public let type: ReactionType
    public var status: Status

    public init(id: String = UUID().uuidString, user: User, createdAt: Date = .now, type: ReactionType, status: Status = .sending) {
        self.id = id
        self.user = user
        self.createdAt = createdAt
        self.type = type
        self.status = status
    }
    
    var emoji: String? {
        switch self.type {
        case .emoji(let emoji): return emoji
        }
    }
}

extension Reaction {
    public enum Status: Codable, Equatable, Hashable, Sendable {
        case sending
        case sent
        case read
        case error
    }
}

