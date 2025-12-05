import SwiftUI

struct GameGridView: View {
    @StateObject var gameStore = GameViewModel()
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: [
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
                ]
            ) {
                ForEach(gameStore.games) { game in
                    GamePosterView(game: game)
                }
            }
        }
    }
}

#Preview {
    GameGridView(gameStore: GameViewModel())
}

