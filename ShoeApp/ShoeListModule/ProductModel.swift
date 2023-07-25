//
//  ProductModel.swift
//  ShoeApp
//
//  Created by TejaDanasvi on 25/7/2023.
//

import Foundation

struct ProductModel: Codable {
        let response: Response?
    
}
struct Response: Codable {
    let category_name: String?
    let products: [Products]?
}
struct Products: Codable, Identifiable {
    var id = UUID().uuidString
    let name: String?
    let image_name: String?
    let price: String?
    let description: String?
    enum CodingKeys: String, CodingKey {

        case name = "name"
        case image_name = "image_name"
        case price = "price"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image_name = try values.decodeIfPresent(String.self, forKey: .image_name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }


}


