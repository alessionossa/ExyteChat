//
//  SwiftUIView.swift
//  
//
//  Created by Alisa Mylnikova on 06.12.2023.
//

import SwiftUI

public extension ChatView where MessageContent == EmptyView {

    init(messages: [Message],
         chatType: ChatType = .conversation,
         replyMode: ReplyMode = .quote,
         messageMenuAction: MessageMenuActionClosure?) {
        self.type = chatType
        self.sections = ChatView.mapMessages(messages, chatType: chatType, replyMode: replyMode)
        self.ids = messages.map { $0.id }
        self.messageMenuAction = messageMenuAction
    }
}

public extension ChatView where MenuAction == DefaultMessageMenuAction {

    init(messages: [Message],
         chatType: ChatType = .conversation,
         replyMode: ReplyMode = .quote,
         messageBuilder: @escaping MessageBuilderClosure) {
        self.type = chatType
        self.sections = ChatView.mapMessages(messages, chatType: chatType, replyMode: replyMode)
        self.ids = messages.map { $0.id }
        self.messageBuilder = messageBuilder
    }
}

public extension ChatView where MessageContent == EmptyView, MenuAction == DefaultMessageMenuAction {

    init(messages: [Message],
         chatType: ChatType = .conversation,
         replyMode: ReplyMode = .quote) {
        self.type = chatType
        self.sections = ChatView.mapMessages(messages, chatType: chatType, replyMode: replyMode)
        self.ids = messages.map { $0.id }
    }
}
