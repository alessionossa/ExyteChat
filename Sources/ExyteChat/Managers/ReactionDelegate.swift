//
//  ReactionDelegate.swift
//  Chat
//

/// A delegate for responding to Message Reactions and optionally configuring the Reaction Menu
///
/// ```swift
/// // Optional configuration methods
/// func shouldShowOverview(for message: Message) -> Bool
/// ```
public protocol ReactionDelegate {
    
    /// Whether or not the Message Menu should include a reaction overview at the top of the screen
    /// - Parameter message: The `Message` the Sender is interacting with
    /// - Returns: Whether the overview is shown or not
    ///
    /// - Note: Optional, defaults to `true` when the message has one or more reactions.
    /// - Note: Called when Chat is preparing to show the Message Menu
    func shouldShowOverview(for message:Message) -> Bool
}

public extension ReactionDelegate {
    func shouldShowOverview(for message:Message) -> Bool { !message.reactions.isEmpty }
}
