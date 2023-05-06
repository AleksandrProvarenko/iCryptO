//
//  ViewCryptoControllerViewModel.swift
//  iCryptO
//
//  Created by Alex Provarenko on 11.04.2023.
//

import UIKit

class ViewCryptoControllerViewModel {
    
    var onImageLoaded: ((UIImage?)-> Void)?
    
    // MARK: - Veriables
    let coin: Coin
    
    // MARK: - Initializer
    init(coin: Coin) {
        self.coin = coin
        self.loadImage()
    }
    
    private func loadImage() {
        DispatchQueue.global().async { [weak self] in
            if let logoURL = self?.coin.logoURL,
               let imageData = try? Data(contentsOf: logoURL),
               let logoImage = UIImage(data: imageData) {
               self?.onImageLoaded?(logoImage)
            }
        }
    }
    
    // MARK: - Computed Properties
    var rankLabel: String {
        return "Rank: \(self.coin.cmc_rank)"
    }
    
    var priceLabel: String {
        return "Rank: $\(self.coin.quote.CAD.price) CAD"
    }
    
    var marketCapLabel: String {
        return "Market Cap: $\(self.coin.quote.CAD.market_kap) CAD"
    }
    
    var maxSupplyLabel: String {
        if self.coin.max_supplay != nil {
            return "Max Supply: \(String(describing: self.coin.max_supplay))"
        } else {
            return "DEBUG"
        }
    }
}
