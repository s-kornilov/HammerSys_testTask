//
//  LocationSelectView.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 14/01/2024.
//

import UIKit

class LocationSelectView: UIView {
    
    //MARK: Set UI elements
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor.cDarkGrey
        label.text = "Москва"
        return label
    }()
    
    let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "icon-arrow")
        return imageView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(locationLabel, arrowImage)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup constraints
    private func setupConstraints() {
        [locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
         locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
         
         arrowImage.topAnchor.constraint(equalTo: topAnchor, constant: 67),
         arrowImage.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 8)
        ].forEach({$0.isActive = true})
    }
    
}
