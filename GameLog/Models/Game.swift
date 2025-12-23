import Foundation

struct Game: Identifiable {
    let id: UUID
    let title: String
    let platform: String
    let year: Int
    let coverURL: URL?
    let averageRating: Double
}

struct GameResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [GameGridItem]
}

struct GameGridItem: Decodable, Identifiable {
    let id: Int
    let name: String
    let backgroundImage: String?
    let rating: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name, rating
        case backgroundImage = "background_image"
    }
}
