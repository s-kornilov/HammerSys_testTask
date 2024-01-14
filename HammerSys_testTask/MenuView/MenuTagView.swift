//
//  MenuTagView.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 14/01/2024.
//

import UIKit

class MenuTagButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    // Общая настройка кнопки
    private func configureButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 17
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        updateButtonState()
    }

    // Обновление внешнего вида кнопки в зависимости от события нажатия
    private func updateButtonState() {
        if isSelected {
            self.layer.borderWidth = 0
            self.backgroundColor = UIColor.cRedAlpha20
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            self.setTitleColor(UIColor.cRed, for: .normal)
        } else {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.cRedAlpha40.cgColor
            self.backgroundColor = nil // Сброс фона на прозрачный
            self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            self.setTitleColor(UIColor.cRedAlpha40, for: .normal)
        }
    }

    // Действие при нажатии на кнопку
    @objc func buttonTapped() {
        isSelected = !isSelected
    }

    override var isSelected: Bool {
        didSet {
            updateButtonState()
        }
    }
}
