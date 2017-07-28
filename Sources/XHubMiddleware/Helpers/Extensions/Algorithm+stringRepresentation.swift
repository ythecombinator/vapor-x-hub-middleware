import Foundation
import Cryptor

typealias Algorithm = HMAC.Algorithm

extension HMAC.Algorithm {
    
     var stringRepresentation: String {
        switch (self) {
        case .sha1:
            return "sha1"
        case .sha224:
            return "sha256"
        case .sha256:
            return "sha256"
        case .sha384:
            return "sha384"
        case .sha512:
            return "sha512"
        case .md5:
            return "md5"
        }
    }
    
}
