//
//  CategoriesResponse.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

struct CategoriesResponse{
    let success: Bool
    let categories: [Category]
}

extension CategoriesResponse : Decodable{
    enum CategoriesResponseCodingKeys: String, CodingKey{
        case success = "ok"
        case categories = "data"
    }
    
    init(from decoder: Decoder)throws{
        let container = try decoder.container(keyedBy: CategoriesResponseCodingKeys.self)
        
        success = try container.decode(Bool.self, forKey: .success)
        categories = try container.decode([Category].self, forKey: .categories)
            .sorted {
                $0.category.uppercased() < $1.category.uppercased()
            }
    }
}
