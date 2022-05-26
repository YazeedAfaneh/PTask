//
//  APIManager.swift
//  PenguininTask
//
//  Created by Yazeed Afaneh on 24/05/2022.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    typealias completionHandler = (Swift.Result<SearchResponse, Error>) -> ()
    
    func request (endpoint: Endpoint , completion: @escaping completionHandler ){
        
        
        var compononets = URLComponents()
        compononets.scheme = endpoint.scheme
        compononets.host = endpoint.baseURL
        compononets.path = endpoint.path
        compononets.queryItems = endpoint.parameters
        
        guard let url = compononets.url else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {return}
            
            guard response != nil , let data = data else {return}
            
            if let responseObject = try? JSONDecoder().decode(SearchResponse.self, from: data){
                
                completion(.success(responseObject))
                print(responseObject.results.first?.urls.raw)
            }else{
                completion(.failure(error!))
            }
            
        }
        
        dataTask.resume()
    }
    
}
