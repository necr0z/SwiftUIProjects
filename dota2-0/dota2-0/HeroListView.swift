import SwiftUI

struct HeroListView: View {
    @ObservedObject var viewModel = HeroViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                NavigationLink(destination: HeroDetailView(hero: hero)) {
                    HStack {
//                        let iconUrl = "https://cdn.dota2.com/apps/dota2/images/heroes/" + hero.icon + "_sb.png"
                        let heroName = hero.name.components(separatedBy: "_").last
                        let iconUrl = "https://cdn.dota2.com/apps/dota2/images/heroes/" + (heroName ?? "") + "_sb.png"
                        AsyncImage(url: URL(string: iconUrl)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            case .success(let image):
                                image.resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "exclamationmark.triangle")
                                    .frame(width: 50, height: 50)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(hero.localized_name)
                                .font(.headline)
                            Text(hero.primary_attr.capitalized + " / " + hero.attack_type)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Dota 2 Heroes")
        }
    }
}

struct HeroListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroListView()
    }
}
