import Foundation

@MainActor
class GameDetailViewModel: ObservableObject {
    @Published var game: GameDetail?
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    private let service = RAWGService()
    private let gameID: Int
    
    init(gameID: Int){
        self.gameID = gameID
    }
    
    func loadGame() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await service.fetchGameDetail(id: gameID)
            self.game = result
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
