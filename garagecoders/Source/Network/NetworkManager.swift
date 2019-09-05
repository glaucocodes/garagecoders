//
//  NetworkManager.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

import Foundation
import Moya

enum APIEnvironment{
    case dev
    case qa
    case production
}
protocol Networkable{
    var provider: MoyaProvider<MovieApi>{get}
    func getCategories(onResult: @escaping ([Category])->(),onError: @escaping (Error)->())
}
struct NetworkManager: Networkable {
    var provider: MoyaProvider<MovieApi> = MoyaProvider<MovieApi>()
    static let enviroment: APIEnvironment = (UIApplication.shared.delegate as! AppDelegate).enviroment
    
    func getCategories(onResult: @escaping ([Category])->(),onError: @escaping (Error)->()) {
        provider .request(.categories, completion: {result in
            switch result{
            case let .success(response):
                do{
                    let response = try JSONDecoder().decode(CategoriesResponse.self, from: response.data)
                    onResult(response.categories)
                }catch let error{
                    onError(error)
                }
            case let .failure(error):
                onError(error)
            }
        })
    }
}
