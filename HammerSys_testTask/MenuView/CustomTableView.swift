//
//  TableView.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 13/01/2024.
//
import UIKit

class CustomTableView: UIView{
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 172
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
    }
}
