import Foundation

extension Data {
    
    var bytes: Array<UInt8> {
        return Array(self)
    }
    
    func toHexString() -> String {
        return self.bytes.toHexString()
    }
    
}
