import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let roles: [String]
    let img: String
    let icon: String
    let base_health: Int
    let base_mana: Int
}
