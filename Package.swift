import PackageDescription
import Foundation

let package = Package(
    name: "XHubMiddleware",
    dependencies: [
            .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
            .Package(url: "https://github.com/IBM-Swift/BlueCryptor.git", majorVersion: 0),            
            .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 1, minor: 1),
            .Package(url: "https://github.com/Quick/Nimble.git", majorVersion: 7)
    ]
)
