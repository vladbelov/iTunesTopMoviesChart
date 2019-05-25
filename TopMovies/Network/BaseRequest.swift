//
//  BaseRequest.swift
//  TopMovies
//
//  Created by Владислав on 21/02/2019.
//  Copyright © 2019 Владислав. All rights reserved.
//

import UIKit

final class BaseRequest {
    
    enum Result {
        case success([MovieInfo])
        case error(Error)
    }
    
    static var shared = BaseRequest()
    
    func request(completion: @escaping (Result) -> Void) {
        guard let url = URL(string: APIConstant.url) else { fatalError("Dont have url") }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let error = err {
                completion(.error(error))
                return
            }
            
            guard let data = data else { fatalError("Dont have data") }
            do {
                let decoder = JSONDecoder()
                let parsingResult = try decoder.decode(Movie.self, from: data)
                completion(.success(parsingResult.feed?.entry ?? []))
            } catch {
                fatalError("JSON Error!")
            }
        }.resume()
    }
}
