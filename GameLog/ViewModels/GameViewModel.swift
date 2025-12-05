import Foundation

class GameViewModel: ObservableObject {
    @Published var games = loadMockGames()
    
    static func loadMockGames()->[Game]{
        return GameViewModel.mockGames
    }

    static var mockGames = [
            Game(id: UUID(), title: "The Witcher 3", platform: "PC", year: 2015, coverURL: nil, averageRating: 4.8),
            Game(id: UUID(), title: "Hades", platform: "Switch", year: 2020, coverURL: nil, averageRating: 4.6),
            Game(id: UUID(), title: "Elden Ring", platform: "PS5", year: 2022, coverURL: nil, averageRating: 4.9)
    ]
    
    static var defaultGame = Game(id: UUID(), title: "The Witcher 3", platform: "PC", year: 2015, coverURL: nil, averageRating: 4.8)
    
}
