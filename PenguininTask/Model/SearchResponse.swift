//
//  SearchResponse.swift
//  PenguininTask
//
//  Created by Yazeed Afaneh on 24/05/2022.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let total, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let id: String
    let resultDescription, altDescription: String?
    let urls: Urls
    let sponsorship: Sponsorship?


    enum CodingKeys: String, CodingKey {
        case id
        case resultDescription = "description"
        case altDescription = "alt_description"
        case urls
        case sponsorship
    }
}




// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
    
    let sponsor: User

    enum CodingKeys: String, CodingKey {
        case sponsor
    }
}

// MARK: - User
struct User: Codable {

    let name: String
    let portfolioURL: String?

    enum CodingKeys: String, CodingKey {

        case name
        case portfolioURL = "portfolio_url"
    }
}
