//
//  UnsplashEndpoint.swift
//  PenguininTask
//
//  Created by Yazeed Afaneh on 24/05/2022.
//

import Foundation

enum UnsplashEndpoint: Endpoint {
    
    case search(query: String)
    
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String{
        switch self {
        default:
            return Constants.BASE_URL
        }
    }
    
    var path: String{
        switch self {
        case .search(_):
            return "/search/photos"
        }
    }
    
    var parameters: [URLQueryItem]{
        switch self {
        case .search(let query):
            return [
                URLQueryItem(name: "page", value: "1") ,
                URLQueryItem(name: "query", value: query) ,
                URLQueryItem(name: "client_id", value: Constants.API_KEY) ,
                URLQueryItem(name: "per_page", value: "15")
            ]
        }
    }
    
    var method: String{
        switch self {
        default:
            return "GET"
        }
    }
    
    
    
    
}

