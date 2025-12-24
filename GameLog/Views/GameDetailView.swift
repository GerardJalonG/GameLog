import SwiftUI

struct GameDetailView: View {
    @StateObject private var vm: GameDetailViewModel
    
    init(gameID: Int) {
        _vm = StateObject(wrappedValue: GameDetailViewModel(gameID: gameID))
    }
    
    init(mockGame: GameDetail) {
        let vm = GameDetailViewModel(gameID: mockGame.id)
        vm.game = mockGame
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if let game = vm.game {
                VStack {
                    AsyncImage(url: URL(string: game.backgroundImage)) { image in
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

                    HStack {
                        Text(game.name)
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    .padding()
                }
            } else if vm.isLoading {
                ProgressView("Cargando…")
                    .padding()
            } else if let error = vm.errorMessage {
                Text(error).foregroundStyle(.red)
            }
        }.task {
            await vm.loadGame()
        }
    }
}

let mockGTADetail = GameDetail(
    id: 3498,
    name: "Grand Theft Auto V",
    description: """
    Los Santos es una metrópolis en expansión llena de gurús de la autoayuda,
    estrellas y celebridades que luchan por sobrevivir en una era de incertidumbre
    económica y reality shows baratos.

    Grand Theft Auto V combina narración y jugabilidad de nuevas maneras mientras
    los jugadores entran y salen repetidamente de las vidas de tres protagonistas
    muy diferentes.
    """,
    released: "2013-09-17",
    metacritic: 97,
    backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg",
    backgroundImageAdditional: "https://media.rawg.io/media/games/6f2/6f2e0d59f92e7b5f2fd8a8df2f9d78b3.jpg"
)


#Preview {
    NavigationStack {
        GameDetailView(mockGame: mockGTADetail)
    }
}
