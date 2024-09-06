//
//  SuperHeroProvider.swift
//  SuperHeroes-iOS-RC
//
//  Created by Mañanas on 5/9/24.
//

import Foundation

class SuperHeroProvider {
    
    static func findSuperHeroesByName(_ name: String,
                                      withResult: @escaping ([SuperHero]) -> Void) {
        guard let url = URL(string:
                                "\(Constants.BASE_URL)search/\(name)") else {
            print("url not valid")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data,
            response, error in
            if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
                return
            }else if let data = data {
                // Process the data
                let result = try!
                JSONDecoder().decode(SuperHeroResponse.self,from:data)
                withResult(result.results)
            }
        }
        task.resume()
    }
}

