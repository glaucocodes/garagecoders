//
//  MovieApi.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

import Foundation
import Moya
enum MovieApi{
    case categories
}
extension MovieApi: TargetType {
    var environmentBaseURL: String{
        switch NetworkManager.enviroment {
            case .production: return "http://garagecoders.rocks:4000/api/movies"
            case .qa: return "http://qa.garagecoders.rocks:4000/api/movies"
            case .dev: return "http://dev.garagecoders.rocks:4000/api/movies"
        }
    }
    
    var baseURL: URL {
        return URL(string: environmentBaseURL)!
    }
    
    var path: String {
        switch self {
        case .categories: return "/categories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .categories: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .categories:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
