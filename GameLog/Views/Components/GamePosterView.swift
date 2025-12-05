
import SwiftUI

struct GamePosterView: View {
    
    let game: Game
    var body: some View {
        VStack(alignment: .leading)
        {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                Text(game.title)
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
    }
}

#Preview {
    GamePosterView(game: GameViewModel.defaultGame)
}
