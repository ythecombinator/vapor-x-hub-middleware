import Vapor
import HTTP

public enum XHubMiddlewareError {
    case noValidHeader
    case noValidBody
    case unverifiedSignature
}

extension XHubMiddlewareError: AbortError {
    
    public var status: Status {
        switch self {
        case .noValidHeader:
            return .badRequest
        case .noValidBody:
            return .badRequest
        case .unverifiedSignature:
            return .unauthorized
        }
    }

    public var reason: String {
        switch self {
        case .noValidHeader:
            return "'X-Hub-Signature' header expected"
        case .noValidBody:
            return "Malformed payload body"
        case .unverifiedSignature:
            return "Invalid signature"
        }
    }
    
}

extension XHubMiddlewareError: Debuggable {
    
    public var identifier: String {
        switch self {
        case .noValidHeader:
            return "noValidHeader"
        case .noValidBody:
            return "noValidBody"
        case .unverifiedSignature:
            return "unverifiedSignature"
        }
    }
    
    public var possibleCauses: [String] {
        switch self {
        case .noValidHeader:
            return [
                "No 'X-Hub-Signature' found on request headers.",
                "Typo found on 'X-Hub-Signature' header."
            ]
        case .noValidBody:
            return [
                "Malformed payload body.",
                "Unhandlable/unknown content/file format."
            ]
        case .unverifiedSignature:
            return [
                "Unexpected key passed to hashing function.",
                "Unexpected message passed to hashing function."
            ]
        }
    }
    
    public var suggestedFixes: [String] {
        switch self {
        case .noValidHeader:
            return [
                "Inspect the received payload.",
                "Get in touch with the payload sender (e.g. Github, Facebook etc.)."
            ]
        case .noValidBody:
            return [
                "Inspect the received payload.",
                "Get in touch with the payload sender (e.g. Github, Facebook etc.)."
            ]
        case .unverifiedSignature:
            return [
                "Ensure that the key from the server matches the key set on middleware setup.",
            ]
        }
    }
    
}
