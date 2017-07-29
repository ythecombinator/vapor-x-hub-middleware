import HTTP
import Vapor

public struct XHubMiddlewareConfiguration {

    public let signature: Signature
    
    public init(protectedBy secret: String) {
        self.signature = Signature(from: secret)
    }
    
}

extension XHubMiddlewareConfiguration: ConfigInitializable {
    
    public init(config: Configs.Config) throws {
        guard let options = config["x-hub-signature"] else {
            throw ConfigError.missingFile("x-hub-signature")
        }
        
        do {
            try self.signature = Signature(from: options.get("secret"))
        } catch {
            throw XHubMiddlewareConfigurationError.missingRequiredConfigurationKey("secret")
        }
    }
    
}
