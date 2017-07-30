import PackageDescription
import Foundation

var isSwiftPackagerManagerTestEnvironment: Bool {
    return ProcessInfo.processInfo.environment["SPM_ENV"] == "test"
}

let package = Package(
    name: "XHubMiddleware",
    dependencies: {
        var deps: [Package.Dependency] = [
            .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
            .Package(url: "https://github.com/IBM-Swift/BlueCryptor.git", majorVersion: 0),
        ]
        if isSwiftPackagerManagerTestEnvironment {
            deps += [
                .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 1, minor: 1),
                .Package(url: "https://github.com/Quick/Nimble.git", majorVersion: 7)
            ]
        }
        return deps
    }(),
    swiftLanguageVersions: [3]
)
