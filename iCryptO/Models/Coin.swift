//
//  Coin.swift
//  iCryptO
//
//  Created by Alex Provarenko on 11.04.2023.
//

import Foundation

struct CoinArray: Decodable {
    let data: [Coin]
}

struct Coin: Decodable {
    let id: Int
    let name: String
    let max_supplay: Int?
    let cmc_rank: Int
    let quote: PricingData
    
    var logoURL: URL? {
        return URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/\(id).png")
    }
}

struct PricingData: Decodable {
    let CAD: CAD
}

struct CAD: Decodable {
    let price: Double
    let market_kap: Double
}
