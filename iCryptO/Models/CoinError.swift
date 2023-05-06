//
//  CoinError.swift
//  iCryptO
//
//  Created by Alex Provarenko on 13.04.2023.
//

import Foundation

struct CoinError: Decodable {
    let errorCode: Int
    let errorMesage: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case errorCode = "error_code"
        case errorMessage = "error_mesage"
    }
    
    init(from decoder: Decoder) throws {
        let conteiner = try decoder.container(keyedBy: CodingKeys.self)
        let status = try conteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .status)
        
        errorCode = try status.decode(Int.self, forKey: .errorCode)
        errorMesage = try status.decode(String.self, forKey: .errorMessage)
    }
}
