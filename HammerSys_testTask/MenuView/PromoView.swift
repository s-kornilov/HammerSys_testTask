//
//  PromoView.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 14/01/2024.
//

import UIKit

class PromoView: UIView {
    
    //MARK: Set UI elements
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let promoViewFirst: UIImageView = {
        let promoView = UIImageView()
        promoView.translatesAutoresizingMaskIntoConstraints = false
        promoView.layer.cornerRadius = 10
        promoView.clipsToBounds = true
        promoView.contentMode = .scaleAspectFill
        promoView.backgroundColor = .black
        promoView.image = UIImage(named: "banner-1")
        return promoView
    }()
    let promoViewSecond: UIImageView = {
        let promoView = UIImageView()
        promoView.translatesAutoresizingMaskIntoConstraints = false
        promoView.layer.cornerRadius = 10
        promoView.clipsToBounds = true
        promoView.contentMode = .scaleAspectFill
        promoView.backgroundColor = .black
        promoView.image = UIImage(named: "banner-2")
        return promoView
    }()
    let promoViewThird: UIImageView = {
        let promoView = UIImageView()
        promoView.translatesAutoresizingMaskIntoConstraints = false
        promoView.layer.cornerRadius = 10
        promoView.clipsToBounds = true
        promoView.contentMode = .scaleAspectFill
        promoView.backgroundColor = .black
        promoView.image = UIImage(named: "banner-3")
        return promoView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(scrollView)
        scrollView.addSubviews(promoViewFirst, promoViewSecond, promoViewThird)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Set UI elements
    private func setupConstraints() {
        [scrollView.topAnchor.constraint(equalTo: self.topAnchor),
         scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         
         promoViewFirst.topAnchor.constraint(equalTo: scrollView.topAnchor),
         promoViewFirst.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
         promoViewFirst.widthAnchor.constraint(equalToConstant: 300),
         promoViewFirst.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
         
         promoViewSecond.topAnchor.constraint(equalTo: scrollView.topAnchor),
         promoViewSecond.leadingAnchor.constraint(equalTo: promoViewFirst.trailingAnchor, constant: 16),
         promoViewSecond.widthAnchor.constraint(equalToConstant: 300),
         promoViewSecond.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
         
         promoViewThird.topAnchor.constraint(equalTo: scrollView.topAnchor),
         promoViewThird.leadingAnchor.constraint(equalTo: promoViewSecond.trailingAnchor, constant: 16),
         promoViewThird.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
         promoViewThird.widthAnchor.constraint(equalToConstant: 300),
         promoViewThird.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ].forEach({$0.isActive = true})
    }
    
}
