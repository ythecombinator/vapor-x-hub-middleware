import HTTP

public enum XHubMiddlewareConfigurationError: Error {
    case configurationFileNotFound
    case missingRequiredConfigurationKey(String)
}
