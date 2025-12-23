
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
