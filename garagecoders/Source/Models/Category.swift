//
//  Category.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

struct Category{
    let id: Int
    let category: String
    let color: String
    let status: Int
    let movies: [Movie]
}

extension Category : Decodable{
    enum CategoryCodingKeys: String, CodingKey{
        case id
        case category
        case color
        case status
        case movies
    }
    
    init(from decoder: Decoder)throws{
        let container = try decoder.container(keyedBy: CategoryCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        category = try container.decode(String.self, forKey: .category)
        color = try container.decode(String.self, forKey: .color)
        status = try container.decode(Int.self, forKey: .status)
        movies = try container.decode([Movie].self, forKey: .movies)
            .sorted{
                $0.year > $1.year
            }
    }
}
