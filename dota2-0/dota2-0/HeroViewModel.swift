import Foundation
import Combine

class HeroViewModel: ObservableObject {
    @Published var heroes = [Hero]()
    
    private var cancellable: AnyCancellable?
    
    init() {
        fetchHeroes()
    }
    
    func fetchHeroes() {
        guard let url = URL(string: "https://api.opendota.com/api/heroStats") else {
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Hero].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching heroes: \(error)")
                }
            }, receiveValue: { heroes in
                self.heroes = heroes
            })
    }
}
    