import Vapor
import HTTP

import Quick
import Nimble

@testable import XHubMiddleware

class XHubMiddlewareTests: QuickSpec {
    
    static var allSpecs = [
        XHubMiddlewareTests.self
    ]
    
    override func spec() {
        
        describe("XHubMiddleware") {
            
            let secret = "secret"
            let middleware = XHubMiddleware(using: XHubMiddlewareConfiguration(protectedBy: secret))
            
            context("after middleware is properly initialized") {

                it("should fail when no valid 'X-Hub-Signature' Header") {
                    
                    let request = self.postHTTPRequest(resultingIn: .noValidHeader)
                    
                    do {
                        let willThrow = try middleware.respond(to: request, chainingTo: MockResponder())
                        expect { willThrow }.to(throwError(errorType: XHubMiddlewareError.self))

                    } catch let error as XHubMiddlewareError {
                        expect(error.reason).to(equal("'X-Hub-Signature' header expected"))
                        expect(error.status).to(equal(Status.badRequest))
                    } catch {
                        print("Request failed: \(error)")
                    }
                }
                
            }
        }
    }
}
