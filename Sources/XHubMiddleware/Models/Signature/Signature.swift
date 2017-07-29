import Cryptor

public class Signature {
    
    private let secret: [UInt8]
    private let algorithm: Algorithm

    init(from secret: String, algorithm: Algorithm = .sha1) {
        self.secret = CryptoUtils.byteArray(fromHex: (secret.data(using: String.Encoding.utf8)?.toHexString())!)
        self.algorithm = algorithm
    }
    
    func match(calculatedResultFrom buffer: [UInt8], with expected: String) -> Bool {
        return self.getSignature(for: buffer) == expected
    }
    
    private func getSignature(for buffer: [UInt8]) -> String? {
        if let hmac = HMAC(using: self.algorithm, key: self.secret).update(byteArray: buffer)?.final() {
            return "\(self.algorithm.stringRepresentation)=\(hmac.toHexString())"
        } else {
            return nil
        }
    }
    
}

