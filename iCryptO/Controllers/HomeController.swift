//
//  HomeController.swift
//  iCryptO
//
//  Created by Alex Provarenko on 11.04.2023.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Variables
    private let coins: [Coin] = Coin.getMockArray()
    
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
        let vc = ViewCryptoController(coin)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
