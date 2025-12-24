import SwiftUI

struct HorizontalCarrousel: View {
    let games: [GameGridItem]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 24) {
                ForEach(games) { game in
                    NavigationLink(destination: GameDetailView(gameID: game.id)) {
                        GamePosterView(game: game)
                    }
                }
            }
        }
        .padding()
    }
}

private let mockGames: [GameGridItem] = [
    .init(id: 1, name: "GTA V", backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg", rating: 4.5),
    .init(id: 2, name: "Mock 2", backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg", rating: 4.2),
    .init(id: 3, name: "Mock 3", backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg", rating: 4.0)
]

#Preview {
    NavigationStack {
        HorizontalCarrousel(games: mockGames)
    }
}
