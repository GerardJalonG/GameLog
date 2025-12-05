import Foundation

struct Game: Identifiable {
    let id: UUID
    let title: String
    let platform: String
    let year: Int
    let coverURL: URL?
    let averageRating: Double
}
