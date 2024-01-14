//
//  CustomTableViewCell.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 13/01/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //MARK: Set UI elements
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor.cDarkGrey
        return label
    }()
    
    let productDescriptionView: UIView = {
        let productDescriptionView = UIView()
        productDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        return productDescriptionView
    }()
    
    let productDescriptionLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = .systemFont(ofSize: 13)
        textView.textColor = UIColor.cMediumGrey
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        return textView
    }()
    
    let productPriceView: UIView = {
        let priceView = UIView()
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.layer.borderWidth = 1
        priceView.layer.borderColor = UIColor.cRed.cgColor
        priceView.layer.cornerRadius = 6
        return priceView
    }()
    
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor.cRed
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.cMoreLightGrey
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup UI
    private func setupUI() {
        cardView.addSubview(productImage)
        productDescriptionView.addSubview(productNameLabel)
        productDescriptionView.addSubview(productDescriptionLabel)
        productPriceView.addSubview(productPriceLabel)
        productDescriptionView.addSubview(productPriceView)
        cardView.addSubview(productDescriptionView)
        cardView.addSubview(separatorView)
        addSubview(cardView)
    }
    
    //MARK: Setup constraint
    private func setupConstraints() {
        [cardView.heightAnchor.constraint(equalToConstant: 148),
         cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
         cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
         cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
         
         productImage.topAnchor.constraint(equalTo: cardView.topAnchor),
         productImage.widthAnchor.constraint(equalToConstant: 132),
         productImage.heightAnchor.constraint(equalToConstant: 127),
         productImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
         
         productDescriptionView.topAnchor.constraint(equalTo: cardView.topAnchor),
         productDescriptionView.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 32),
         productDescriptionView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
         
         productNameLabel.topAnchor.constraint(equalTo: productDescriptionView.topAnchor),
         productNameLabel.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor),
         
         productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8),
         productDescriptionLabel.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor),
         productDescriptionLabel.trailingAnchor.constraint(equalTo: productDescriptionView.trailingAnchor),
         
         productPriceView.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 16),
         productPriceView.trailingAnchor.constraint(equalTo: productDescriptionView.trailingAnchor),
         productPriceView.bottomAnchor.constraint(equalTo: productDescriptionView.bottomAnchor),
         productPriceView.heightAnchor.constraint(equalToConstant: 32),
         
         productPriceLabel.topAnchor.constraint(equalTo: productPriceView.topAnchor, constant: 8),
         productPriceLabel.trailingAnchor.constraint(equalTo: productPriceView.trailingAnchor, constant: -9),
         productPriceLabel.bottomAnchor.constraint(equalTo: productPriceView.bottomAnchor, constant: -8),
         productPriceLabel.leadingAnchor.constraint(equalTo: productPriceView.leadingAnchor, constant: 9),
         
         separatorView.heightAnchor.constraint(equalToConstant: 1),
         separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
         separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         separatorView.topAnchor.constraint(equalTo: productDescriptionView.bottomAnchor, constant: 24),
         separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

         
        ].forEach({$0.isActive = true})
    }
    
    func configure(menuItem: MenuItem) {
        productNameLabel.text = menuItem.name
        productDescriptionLabel.text = menuItem.description
        productPriceLabel.text = "от \(menuItem.price) р"
        if let url = URL(string: menuItem.image) {
            loadImage(from: url)
        }else {
            return
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  let data = data,
                  error == nil,
                  let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.productImage.image = image
            }
        }.resume()
    }
}

