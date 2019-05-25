//
//  Models.swift
//  TopMovies
//
//  Created by Владислав on 20/02/2019.
//  Copyright © 2019 Владислав. All rights reserved.
//

struct Movie: Codable {
    let feed: Feed?
}

struct Feed: Codable {
    let author: Author?
    let entry: [MovieInfo]?
    let updated: Label?
    let rights: Label?
    let title: Label?
    let icon: Label?
    let link: [Link]?
    let id: Label?
}

struct Author: Codable {
    let name: Label?
    let uri: Label?
}

struct MovieInfo: Codable {
    let name: Label?
    let image: [Image]?
    let summary: Label?
    let price: Price?
    let contentType: ContentType?
    let rights: Label?
    let title: Label?
    let link: [Link]?
    let id: Id?
    let artist: Label?
    let category: Category?
    let releaseDate: ReleaseDate?
    
    enum CodingKeys: String, CodingKey {
        case name = "im:name"
        case image = "im:image"
        case summary
        case price = "im:price"
        case contentType = "im:contentType"
        case rights
        case title
        case link
        case id
        case artist = "im:artist"
        case category
        case releaseDate = "im:releaseDate"
    }
}

struct Image: Codable {
    let label: String?
    let attributes: ImageAttributes?
}

struct Price: Codable {
    let label: String?
    let attributes: PriceAttributes?
}

struct ContentType: Codable {
    let attributes: ContentTypeAttributes?
}

struct Id: Codable {
    let label: String?
    let attributes: IdAttributes?
}

struct Category: Codable {
    let attributes: CategoryAttributes?
}

struct ReleaseDate: Codable {
    let label: String?
    let attributes: Label?
}

struct CategoryAttributes: Codable {
    let id: String?
    let term: String?
    let scheme: String?
    let label: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "in:id"
        case term
        case scheme
        case label
    }
}

struct ImageAttributes: Codable {
    let height: String?
}

struct IdAttributes: Codable {
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "im:id"
    }
}

struct ContentTypeAttributes: Codable {
    let term: String?
    let label: String?
}

struct PriceAttributes: Codable {
    let amount: String?
    let currency: String?
}

struct Link: Codable {
    let attributes: Attributes
}

struct Attributes: Codable {
    let rel: String?
    let type: String?
    let href: String?
}

struct Label: Codable {
    let label: String?
}
