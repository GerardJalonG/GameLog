import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case urlSessionError(Error)
    case invalidResponse
    case noData
    case decodingFailed(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid"
        case .invalidResponse:
            return "Invalid response from server"
        case .noData:
            return "No data received from server"
        case .urlSessionError(let error):
            return "Network error: \(error.localizedDescription)"
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}
