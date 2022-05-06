//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var coffeeShopeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        self.coffeeShopeTableView.rowHeight = UITableView.automaticDimension
    }
    
    func registerNib() {
        self.coffeeShopeTableView.register(UINib(nibName: "CoffeeShopItemView", bundle: nil), forCellReuseIdentifier: "CoffeeShopItemView")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeShopItemView", for: indexPath) as? CoffeeShopItemView else {
            return UITableViewCell()
        }
        cell.nameLabel.text = "Lofty"
        cell.reviewLabel.text = "Knowledgeable staff, stacked menu. Trust the Ethiopian in a pour over if you know your flavors. Will be back for the rest of this menu soon."
        cell.layoutIfNeeded()
        cell.ratingLabel.text = "rating: 4"
        
        return cell
    }
}

