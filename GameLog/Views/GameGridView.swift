import SwiftUI

struct GameGridView: View {
    @StateObject private var vm = GameViewModel()

    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                if vm.isLoading {
                    ProgressView("Cargando…")
                        .padding()
                } else if let error = vm.errorMessage {
                    VStack(spacing: 12) {
                        Text(error).foregroundColor(.red)
                        Button("Reintentar") {
                            Task { await vm.loadGames() }
                        }
                    }
                } else {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(vm.games) { game in
                            NavigationLink(destination: GameDetailView(gameID: game.id)) {
                                GamePosterView(game: game)
                            }
                        }
                    }
                    .padding()
                }
            }
            .task {
                await vm.loadGames()
            }
        }
    }
}

private let mockGTA: GameGridItem = .init(
    id: 3498,
    name: "Grand Theft Auto V",
    backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg",
    rating: 4.5
)


#Preview("Grid mini") {
    ScrollView {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            ForEach([mockGTA, mockGTA, mockGTA]) { game in
                GamePosterView(game: game)
            }
        }
        .padding()
    }
}

