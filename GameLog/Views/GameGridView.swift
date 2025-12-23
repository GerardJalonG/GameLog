import SwiftUI

struct GameGridView: View {
    @StateObject private var vm = GameViewModel()

    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        Text("Game List").font(.largeTitle)
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
                        GamePosterView(game: game)
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
