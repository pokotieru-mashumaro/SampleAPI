import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    // MARK: Register User
    app.post("user") { req async throws -> UserModel in
        let data = try req.content.decode(UserModel.self)
        let user = UserModel(id: data.id,
                             name: data.name,
                             birthday: data.birthday)
        try await user.save(on: req.db)
        return user
    }
    
    app.get("user") { req -> [UserModel] in
        return try await UserModel.query(on: req.db).all()
    }

    try app.register(collection: TodoController())
}
