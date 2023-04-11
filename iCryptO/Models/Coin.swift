//
//  Coin.swift
//  iCryptO
//
//  Created by Alex Provarenko on 11.04.2023.
//

import Foundation

struct Coin {
    
    let id: Int
    let name: String
    let max_suplply: Int?
    let cmc_rank: Int
    let quote: Quote
    
    var logoURL = URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/1.png")

    struct Quote {
        let CAD: CAD
        
        struct CAD {
            let price: Double
            let market_kap: Double
        }
    }
}

extension Coin {
    
    public static func getMockArray() -> [Coin] {
        return [
            Coin(id: 1, name: "Bitcoin",
                 max_suplply: 200, cmc_rank: 1,
                 quote: Quote(CAD: Quote.CAD(price: 50000, market_kap: 1_000_000))),
            Coin(id: 2, name: "Ethereum",
                 max_suplply: nil, cmc_rank: 2,
                 quote: Quote(CAD: Quote.CAD(price: 2000, market_kap: 500_000))),
            Coin(id: 3, name: "Monero",
                 max_suplply: nil, cmc_rank: 3,
                 quote: Quote(CAD: Quote.CAD(price: 200, market_kap: 250_000)))
        ]
    }
}
