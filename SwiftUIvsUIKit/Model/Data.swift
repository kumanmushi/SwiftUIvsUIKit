import Foundation
import SwiftUI

// MARK: - Okashi

struct OkashiResponse: Codable {
    let item: [Okashi]
}

// MARK: - Item

struct Okashi: Codable, Identifiable {
    let id: String
    let name: String
    let maker: String
    let url: String
    let image: String
}

func getOkashiList() -> [Okashi] {
    try! JSONDecoder().decode(
        OkashiResponse.self,
        from: try! Data(
            contentsOf: Bundle.main.url(
                forResource: "okashi",
                withExtension: "json"
            )!
        )
    ).item
}
