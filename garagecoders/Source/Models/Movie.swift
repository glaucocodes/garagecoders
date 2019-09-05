//
//  Movie.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

struct Movie{
    let id: Int
    let title: String
    let subTitle: String
    let year: Int
    let description: String
    let status: Int
    let idCategory: Int
}

extension Movie : Decodable{
    enum MovieCodingKeys: String, CodingKey{
        case id
        case title
        case subTitle = "subtitle"
        case year
        case description
        case status
        case idCategory
    }
    
    init(from decoder: Decoder)throws{
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        subTitle = try container.decode(String.self, forKey: .subTitle)
        year = try container.decode(Int.self, forKey: .year)
        description = try container.decode(String.self, forKey: .description)
        status = try container.decode(Int.self, forKey: .status)
        idCategory = try container.decode(Int.self, forKey: .idCategory)
    }
}
