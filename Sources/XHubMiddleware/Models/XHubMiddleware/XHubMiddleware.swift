import HTTP
import Vapor

public final class XHubMiddleware: Middleware {

    public let configuration: XHubMiddlewareConfiguration
    
    public init(using configuration: XHubMiddlewareConfiguration) {
        self.configuration = configuration
    }
    
    public convenience init(using configuration: Configs.Config) throws {
        let config = try XHubMiddlewareConfiguration(config: configuration)
        self.init(using: config)
    }
    
    public func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        guard let expectedKey = request.xHubSignature else {
            throw XHubMiddlewareError.noValidHeader
        }
        
        guard self.configuration.signature.match(calculatedResultFrom: buffer, with: expectedKey) else {
            throw XHubMiddlewareError.unverifiedSignature
        }
        
        return try next.respond(to: request)
    }
    
}
