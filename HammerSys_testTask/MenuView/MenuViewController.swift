//
//  MenuViewController.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 12/01/2024.
//

import UIKit

protocol DataViewInterface: AnyObject {
    func updateWithData(_ data: MenuData)
    func showError(_ error: Error)
}

protocol MenuTagsDelegate: AnyObject {
    func didSelectTag(atIndex index: Int)
}

struct OutputItem {
    var category: String
    var items: [MenuItem]
}

class MenuViewController: UIViewController, DataViewInterface, UITableViewDelegate{
    var presenter: DataPresenter!
    var customTableView = CustomTableView()
    var promo = PromoView()
    var locationSelect = LocationSelectView()
    var menuTags = MenuTags()
    var outputItems: [OutputItem] = []
    private var menuData: MenuData?
    
    var locationSelectTopConstraint: NSLayoutConstraint!
    var menuTagsTopConstraint: NSLayoutConstraint!
    var customTableViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cMoreLightGrey
        menuTags.delegate = self
        
        presenter = DataPresenter()
        presenter.view = self
        presenter.loadData()
        
        customTableView = CustomTableView()
        customTableView.tableView.dataSource = self
        customTableView.tableView.delegate = self
        
        view.addSubviews(locationSelect, promo, menuTags, customTableView)
        locationSelect.translatesAutoresizingMaskIntoConstraints = false
        menuTags.translatesAutoresizingMaskIntoConstraints = false
        promo.translatesAutoresizingMaskIntoConstraints = false
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupConstraints() {
        [promo.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
         promo.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
         promo.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
         
         menuTags.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
         menuTags.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
         
         customTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
         customTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         customTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ].forEach({$0.isActive = true})
        
        locationSelectTopConstraint = locationSelect.topAnchor.constraint(equalTo: view.topAnchor)
        locationSelectTopConstraint.isActive = true
        
        menuTagsTopConstraint = menuTags.topAnchor.constraint(equalTo: view.topAnchor, constant: 240)
        menuTagsTopConstraint.isActive = true
        customTableViewTopConstraint = customTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 296)
        customTableViewTopConstraint.isActive = true
    }
    
    func updateWithData(_ data: MenuData) {
        self.menuData = data
        outputItems.removeAll()
        if let menuData = menuData {
            outputItems.append(OutputItem(category: "Пицца", items: menuData.pizzas))
            outputItems.append(OutputItem(category: "Комбо", items: menuData.combo))
            outputItems.append(OutputItem(category: "Десерты", items: menuData.desserts))
            outputItems.append(OutputItem(category: "Напитки", items: menuData.drinks))
        }
        
        DispatchQueue.main.async {
            self.customTableView.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let threshold: CGFloat = 100
        
        if scrollView.contentOffset.y > threshold {
            if promo.isHidden == false {
                UIView.animate(withDuration: 0.2) {
                    self.promo.isHidden = true
                    self.locationSelect.isHidden = true
                    self.menuTagsTopConstraint.constant = 60
                    self.customTableViewTopConstraint.constant = 116
                    self.view.layoutIfNeeded()
                }
            }
        } else {
            if promo.isHidden == true {
                UIView.animate(withDuration: 0.2) {
                    self.promo.isHidden = false
                    self.locationSelect.isHidden = false
                    self.menuTagsTopConstraint.constant = 240
                    self.customTableViewTopConstraint.constant = 296
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
}

extension MenuViewController: UITableViewDataSource, MenuTagsDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return outputItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outputItems[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let menuItem = outputItems[indexPath.section].items[indexPath.row]
        cell.configure(menuItem: menuItem)
        return cell
    }
    
    func didSelectTag(atIndex index: Int) {
        let indexPath = IndexPath(row: 0, section: index - 1)
        customTableView.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
