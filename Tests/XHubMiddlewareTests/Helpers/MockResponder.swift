import Vapor
import HTTP

struct MockResponder: Responder {
    
    func respond(to request: Request) throws -> Response {
        return "👽 hello, humans 👽".makeResponse()
    }
    
}
