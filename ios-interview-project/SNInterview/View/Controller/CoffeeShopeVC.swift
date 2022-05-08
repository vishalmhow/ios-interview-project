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
    // MARK: - Register Nib
    func registerNib() {
        self.coffeeShopeTableView.register(UINib(nibName: "CoffeeShopItemView", bundle: nil), forCellReuseIdentifier: "CoffeeShopItemView")
    }
}
// MARK: - UITableview Extention for its delegates and DataSource Implementation
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let reviewViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ReviewVC") as? ReviewVC else {
            return
        }
        reviewViewController.reviewString = self.viewModel.coffeeShopes[indexPath.row].review
        self.addChild(reviewViewController)
        reviewViewController.view.frame = self.view.frame
        self.view.addSubview(reviewViewController.view)
        reviewViewController.didMove(toParent: self)
    }
}

