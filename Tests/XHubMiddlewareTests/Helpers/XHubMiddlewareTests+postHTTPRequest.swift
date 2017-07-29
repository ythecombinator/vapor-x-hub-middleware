import Vapor
import HTTP

extension XHubMiddlewareTests {
    
    func postHTTPRequest(resultingIn status: RequestResult) -> Request {
        var payload = JSON()
        try! payload.set("example", "payload")
        let body = try! Body.data(payload.makeBytes())
        let request = Request(method: .post, uri: "/", body: body)
        
        switch status {
        case .noValidHeader:
            let headers: [HeaderKey : String] = ["X-Hub-Signatur" : "sha1=d5af84e51430cb60721e997d095cd31568e4b896"]
            request.headers = headers
        case .unverifiedSignature:
            let headers: [HeaderKey : String] = ["X-Hub-Signature" : "sha1=d5af84e51430cb60721e997d095cd31568e4b89"]
            request.headers = headers
        }
        
        return request
    }
    
}
