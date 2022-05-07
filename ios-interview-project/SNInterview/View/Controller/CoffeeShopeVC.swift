//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

class CoffeeShopeVC: UIViewController {
    @IBOutlet weak var coffeeShopeTableView: UITableView!
    let viewModel = CoffeeShopeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        self.coffeeShopeTableView.rowHeight = UITableView.automaticDimension
        self.viewModel.getCoffeeShopList(fileName: "CoffeeShops") { status in
            if status {
                DispatchQueue.main.async {
                    self.coffeeShopeTableView.reloadData()
                }
            }
        }
    }
    
    func registerNib() {
        self.coffeeShopeTableView.register(UINib(nibName: "CoffeeShopItemView", bundle: nil), forCellReuseIdentifier: "CoffeeShopItemView")
    }
}
extension CoffeeShopeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.coffeeShopes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeShopItemView", for: indexPath) as? CoffeeShopItemView else {
            return UITableViewCell()
        }
        cell.configureCoffeeShopItemView(coffeeShop: self.viewModel.coffeeShopes[indexPath.row])
        return cell
    }
}

