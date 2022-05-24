//
//  Endpoint.swift
//  PenguininTask
//
//  Created by Yazeed Afaneh on 24/05/2022.
//

import Foundation


struct Constants {
    static let BASE_URL = "api.unsplash.com"
    static let API_KEY = "VsjnietnSVJrJ6NHA0J3WlRz4RAMrtorAtru66yEKTk"
}


protocol Endpoint {
    
    // http / https
    var scheme: String { get }
    // "api.unsplash.com"
    var baseURL: String { get }
    // /search/photos
    var path: String { get }
    // query = "Cars"
    var parameters: [URLQueryItem] { get }
    // GET
    var method: String { get }
}

