import SwiftUI

struct HeroDetailView: View {
    var hero: Hero
    
    var body: some View {
        
        let heroName = hero.name.components(separatedBy: "_").last
        let imgUrl = "https://cdn.dota2.com/apps/dota2/images/heroes/" + (heroName ?? "") + "_sb.png"
        
        VStack(alignment: .leading, spacing: 20) {
            AsyncImage(url: URL(string: imgUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 200)
                case .success(let image):
                    image.resizable()
                        .frame(height: 200)
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "exclamationmark.triangle")
                        .frame(height: 200)
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(hero.localized_name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Primary Attribute: \(hero.primary_attr.capitalized)")
                .font(.title2)
            
            Text("Attack Type: \(hero.attack_type)")
                .font(.title2)
            
            Text("Roles: \(hero.roles.joined(separator: ", "))")
                .font(.title2)
            
            Spacer()
        }
        .padding()
        .navigationTitle(hero.localized_name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailView(hero: Hero(id: 1, name: "antimage", localized_name: "Anti-Mage", primary_attr: "agi", attack_type: "Melee", roles: ["Carry", "Escape", "Nuker"], img: "antimage_sb.png", icon: "antimage_sb.png", base_health: 200, base_mana: 75))
    }
}
