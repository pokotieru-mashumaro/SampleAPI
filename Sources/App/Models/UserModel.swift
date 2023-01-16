//
//  File.swift
//  
//
//  Created by iniad on 2023/01/16.
//

import Fluent
import Vapor

// classである必要がある
final class UserModel: Model, Content {
    static let schema: String = CreateUserTable.user

    @ID(key: .id)
    var id: UUID?

    @Field(key: CreateUserTable.name)
    var name: String

    @Field(key: CreateUserTable.birthday)
    var birthday: String

    init() {}

    init(id: UUID? = nil, name: String, birthday: String) {
        self.id = id
        self.name = name
        self.birthday = birthday
    }
}
