import Foundation

struct GameDetail: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let released: String
    let metacritic: Int
    let backgroundImage: String
    let backgroundImageAdditional: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, released, metacritic
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
    }
}
