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
//       let cofee = viewModel.loadJson(fileName: "CoffeeShops")
//        print(cofee)
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
        cell.nameLabel.text = "Lofty"
        cell.reviewLabel.text = "Knowledgeable staff, stacked menu. Trust the Ethiopian in a pour over if you know your flavors. Will be back for the rest of this menu soon."
        cell.layoutIfNeeded()
        cell.ratingLabel.text = "rating: 4"
        
        cell.nameLabel.text = self.viewModel.coffeeShopes[indexPath.row].name
        
        return cell
    }
}

