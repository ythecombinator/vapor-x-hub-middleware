import Vapor

extension Request {
    
    var xHubSignature: String? {
        return headers["X-Hub-Signature"]
    }
    
}
