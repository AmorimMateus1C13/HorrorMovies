import Foundation
import UIKit

struct DataModel: Codable {
    let page: Int
    let results: [Results]
}

struct Results: Codable {
    
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let title: String
}

