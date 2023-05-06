//
//  HomeController.swift
//  iCryptO
//
//  Created by Alex Provarenko on 11.04.2023.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Variables
    private let coins: [Coin] = [
        Coin(id: 1, name: "Bitcoin",
             max_supplay: 200, cmc_rank: 1,
             quote: PricingData(CAD: CAD(price: 50000, market_kap: 1_000_000))),
        Coin(id: 2, name: "Ethereum",
             max_supplay: nil, cmc_rank: 2,
             quote: PricingData(CAD: CAD(price: 2000, market_kap: 500_000))),
        Coin(id: 3, name: "Monero",
             max_supplay: nil, cmc_rank: 3,
             quote: PricingData(CAD: CAD(price: 200, market_kap: 250_000)))
    ]
    
    // MARK: - UIComponents
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "iCryptO"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        stupUI()
    }
    
    // MARK: - UISetUP
    private func stupUI() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - TableViewFunctions
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell else { fatalError("Unable to dequeue CoinCell in HomeController") }
        
        let coin = self.coins[indexPath.row]
        cell.configure(with: coin)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let coin = self.coins[indexPath.row]
        let viewModel = ViewCryptoControllerViewModel(coin: coin)
        let vc = ViewCryptoController(viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
