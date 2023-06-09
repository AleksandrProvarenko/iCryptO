//
//  HTTP.swift
//  iCryptO
//
//  Created by Alex Provarenko on 05.05.2023.
//

import Foundation

enum HTTP {
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        
        enum Key: String {
            case contentType = "Content-Type"
            case apiKey = "X-CMC_PRO_API_KEY"
        }
        
        enum Value: String {
            case applicationJson = "application/Json"
        }
    }
}
