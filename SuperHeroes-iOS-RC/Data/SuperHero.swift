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
    let image: Image
}

struct Image: Codable {
    let url: String
}

