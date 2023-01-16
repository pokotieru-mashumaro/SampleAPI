import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "sample_user",
        password: Environment.get("DATABASE_PASSWORD") ?? "sample",
        database: Environment.get("DATABASE_NAME") ?? "sample_db"
    ), as: .psql)

    app.migrations.add(CreateUserTable())
    //app.migrations.add(CreateTodo())

    app.http.server.configuration.port = 5000
    
    // register routes
    try routes(app)
}
