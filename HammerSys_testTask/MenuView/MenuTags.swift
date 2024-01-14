//
//  MenuTags.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 14/01/2024.
//

import UIKit

class MenuTags: UIView {
    weak var delegate: MenuTagsDelegate?
    
    //MARK: Set UI elements
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let menuTagButtonFirst: MenuTagButton = {
        let menuTagButton = MenuTagButton()
        menuTagButton.setTitle("Пицца", for: .normal)
        menuTagButton.tag = 1
        return menuTagButton
    }()
    
    let menuTagButtonSecond: MenuTagButton = {
        let menuTagButton = MenuTagButton()
        menuTagButton.setTitle("Комбо", for: .normal)
        menuTagButton.tag = 2
        return menuTagButton
    }()
    
    let menuTagButtonThird: MenuTagButton = {
        let menuTagButton = MenuTagButton()
        menuTagButton.setTitle("Десерты", for: .normal)
        menuTagButton.tag = 3
        return menuTagButton
    }()
    
    let menuTagButtonFour: MenuTagButton = {
        let menuTagButton = MenuTagButton()
        menuTagButton.setTitle("Напитки", for: .normal)
        menuTagButton.tag = 4
        return menuTagButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView.addSubviews(menuTagButtonFirst, menuTagButtonSecond, menuTagButtonThird, menuTagButtonFour)
        addSubview(scrollView)
        
        backgroundColor = .cMoreLightGrey
        menuTagButtonFirst.isSelected = true
        
        menuTagButtonFirst.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        menuTagButtonSecond.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        menuTagButtonThird.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        menuTagButtonFour.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup constrainsts
    private func setupConstraints() {
        [scrollView.topAnchor.constraint(equalTo: self.topAnchor),
         scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         scrollView.heightAnchor.constraint(equalToConstant: 32),
         
         menuTagButtonFirst.topAnchor.constraint(equalTo: scrollView.topAnchor),
         menuTagButtonFirst.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
         menuTagButtonFirst.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
         menuTagButtonFirst.heightAnchor.constraint(equalToConstant: 32),
         menuTagButtonFirst.widthAnchor.constraint(equalToConstant: 88),
         
         menuTagButtonSecond.topAnchor.constraint(equalTo: scrollView.topAnchor),
         menuTagButtonSecond.leadingAnchor.constraint(equalTo: menuTagButtonFirst.trailingAnchor, constant: 16),
         menuTagButtonSecond.heightAnchor.constraint(equalToConstant: 32),
         menuTagButtonSecond.widthAnchor.constraint(equalToConstant: 88),
         
         menuTagButtonThird.topAnchor.constraint(equalTo: scrollView.topAnchor),
         menuTagButtonThird.leadingAnchor.constraint(equalTo: menuTagButtonSecond.trailingAnchor, constant: 16),
         menuTagButtonThird.heightAnchor.constraint(equalToConstant: 32),
         menuTagButtonThird.widthAnchor.constraint(equalToConstant: 88),
         
         menuTagButtonFour.topAnchor.constraint(equalTo: scrollView.topAnchor),
         menuTagButtonFour.leadingAnchor.constraint(equalTo: menuTagButtonThird.trailingAnchor, constant: 16),
         menuTagButtonFour.heightAnchor.constraint(equalToConstant: 32),
         menuTagButtonFour.widthAnchor.constraint(equalToConstant: 88),
         menuTagButtonFour.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
         
        ].forEach({$0.isActive = true})
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        delegate?.didSelectTag(atIndex: sender.tag)
        
        let buttons = [menuTagButtonFirst, menuTagButtonSecond, menuTagButtonThird, menuTagButtonFour]
        
        buttons.forEach { button in
            button.isSelected = (button == sender)
            
        }
    }
}

