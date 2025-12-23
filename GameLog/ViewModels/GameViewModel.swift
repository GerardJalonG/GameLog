import Foundation

@MainActor
class GameViewModel: ObservableObject {
    @Published var games: [GameGridItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = RAWGService()

    func loadGames() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await service.fetchGames(pageSize: 12)
            self.games = result
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
