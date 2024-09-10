//
//  SuperHero.swift
//  SuperHeroes-iOS-RC
//
//  Created by Mañanas on 5/9/24.
//

import Foundation

// El struct es como el dataclass en KOTLIN.
// Parseamos el JSON, el codable trnsaformara de string a una estructura de datos.

struct SuperHeroResponse: Codable {
    let response: String
    let results: [SuperHero]
}

struct SuperHero: Codable {
    let id: String
    let name: String
    let powerstats: Stats
    let biography:Biography
    //let work:Work
    var image: Image
}

struct Image: Codable {
    let url: String
}

struct Biography: Codable {
    let realName: String
    let placeOfBirth: String
    let publisher: String
    let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case publisher, alignment
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
}

struct Stats: Codable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
}
