import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case missingAPIKey
    case decodingFailed(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .missingAPIKey:
            return "Missing API key in Info.plist"
        case .decodingFailed(let err):
            return "Failed to decode: \(err.localizedDescription)"
        }
    }
}
