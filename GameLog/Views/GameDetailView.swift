import SwiftUI

struct GameDetailView: View {
    let game: GameGridItem
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: game.backgroundImage ?? "")) { image in
                   image
                       .resizable()
                       .scaledToFill()
                       .frame(height: 240)
                       .clipped()
               } placeholder: {
                   Rectangle()
                       .fill(.gray.opacity(0.3))
                       .frame(height: 240)
               }
            
            HStack{
                Text(game.name)
                    .font(.largeTitle)
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
    GameDetailView(game: mockGTA)
}
