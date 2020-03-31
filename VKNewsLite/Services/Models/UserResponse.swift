//
//  UserResponse.swift
//  VKNewsLite
//
//  Created by Виктор on 31.03.2020.
//  Copyright © 2020 SwiftViktor. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
