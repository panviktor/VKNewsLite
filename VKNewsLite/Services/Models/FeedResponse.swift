//
//  FeedResponse.swift
//  VKNewsLite
//
//  Created by Виктор on 24.03.2020.
//  Copyright © 2020 SwiftViktor. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let repost: CountableItem?
    let views: CountableItem?
}

struct CountableItem: Decodable {
    let count: Int
}
