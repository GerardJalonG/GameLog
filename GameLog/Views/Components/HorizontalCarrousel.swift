import SwiftUI

struct HorizontalCarrousel: View {
    @StateObject private var vm = GameViewModel()
    var body: some View {
        ScrollView(.horizontal) {
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
                LazyHStack(alignment: .top, spacing: 24) {
                    ForEach(vm.games) { game in
                        NavigationLink(destination: GameDetailView(gameID: game.id)) {
                            GamePosterView(game: game)
                        }
                    }
                }
            }
        }
        .task {
            await vm.loadGames()
        }
        .padding()
    }
}

#Preview {
    HorizontalCarrousel()
}
