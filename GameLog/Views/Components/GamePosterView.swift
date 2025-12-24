
import SwiftUI
struct GamePosterView: View {
    let game: GameGridItem

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: game.backgroundImage ?? "")) { image in
                           image
                               .resizable()
                               .scaledToFill()
                               .frame(width: 110, height: 160)
                               .clipped()
                               .cornerRadius(12)
                       } placeholder: {
                           RoundedRectangle(cornerRadius: 12)
                               .fill(.gray.opacity(0.3))
                               .frame(width: 110, height: 160)
                       }
        }
    }
}

private let mockGTA: GameGridItem = .init(
    id: 3498,
    name: "Grand Theft Auto V",
    backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg",
    rating: 4.47
)

#Preview {
    GamePosterView(game: mockGTA)
        .padding()
}
