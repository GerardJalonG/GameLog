import SwiftUI

struct MainView: View {
    @StateObject private var vm = GameViewModel()

    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    if vm.isLoading {
                        ProgressView("Cargando…")
                    } else if let error = vm.errorMessage {
                        Text(error)
                    } else {
                        HorizontalCarrousel(games: vm.games)
                    }
                }
                .task { await vm.loadGames() }
            }
        }
    }
}

#Preview {
    MainView()
}
