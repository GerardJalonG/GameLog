import Foundation

struct RAWGService {
    private let baseURL = "https://api.rawg.io/api"

    func fetchGames(pageSize: Int = 21) async throws -> [GameGridItem] {

        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "RAWG_API_KEY") as? String,
              !apiKey.isEmpty else {
            throw APIError.missingAPIKey
        }
        var components = URLComponents(string: "\(baseURL)/games")!
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "page_size", value: "\(pageSize)")
        ]

        guard let url = components.url else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw APIError.invalidResponse
        }
        
        let decoded = try JSONDecoder().decode(GameResponse.self, from: data)
        return decoded.results
    }
    
    func fetchGameDetail(id: Int) async throws -> GameDetail {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "RAWG_API_KEY") as? String,
              !apiKey.isEmpty else {
            throw APIError.missingAPIKey
        }
        
        var components = URLComponents(string: "\(baseURL)/games/\(id)")!
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw APIError.invalidResponse
        }
        
        let decoded = try JSONDecoder().decode(GameDetail.self, from: data)
        return decoded
    }
}
