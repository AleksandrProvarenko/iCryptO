//
//  ViewCryptoController.swift
//  iCryptO
//
//  Created by Alex Provarenko on 11.04.2023.
//

import UIKit

class ViewCryptoController: UIViewController {
    
    // MARK: - Variables
    let viewModel: ViewCryptoControllerViewModel
    
    // MARK: - UIComponents
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let coinLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "questionmark")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .label
        return image
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        return label
    }()
    
    private let marketCapLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 500
        return label
    }()
    
    private let maxSupplyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [rankLabel, priceLabel, marketCapLabel, maxSupplyLabel])
        vStack.axis = .vertical
        vStack.spacing = 12
        vStack.distribution = .fill
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.alignment = .center
        return vStack
    }()
    
    // MARK: - LifeCycle
    init(_ viewModel: ViewCryptoControllerViewModel) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = viewModel.coin.name
        rankLabel.text = viewModel.rankLabel
        priceLabel.text = viewModel.priceLabel
        marketCapLabel.text = viewModel.marketCapLabel
        maxSupplyLabel.text = viewModel.maxSupplyLabel
        
        self.viewModel.onImageLoaded = { [weak self] logoImage in
            DispatchQueue.main.async {
                self?.coinLogo.image = logoImage
            }
        }
        
        navBar()
        setupUI()
    }
    
    // MARK: - UISetUP
    private func navBar() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(coinLogo)
        contentView.addSubview(vStack)
        
        let hight = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hight.priority = UILayoutPriority(1)
        hight.isActive = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            coinLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            coinLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            coinLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coinLogo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coinLogo.heightAnchor.constraint(equalToConstant: 200),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.topAnchor.constraint(equalTo: coinLogo.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
