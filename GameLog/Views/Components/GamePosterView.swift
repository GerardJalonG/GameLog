
import SwiftUI
struct GamePosterView: View {
    let game: GameGridItem

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: game.backgroundImage ?? "")) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(height: 140)
            .clipped()
            .cornerRadius(10)

            Text(game.name)
                .font(.caption)
                .lineLimit(2)
        }
    }
}
