import SwiftUI

struct GameDetailView: View {
    let game: GameGridItem
    
    var body: some View {
        
    }
}

private let mockGTA: GameGridItem = .init(
    id: 3498,
    name: "Grand Theft Auto V",
    backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg",
    rating: 4.47
)


#Preview()
GameDetailView(game: mockGTA)
