//
//  CoffeeShopItemView.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

class CoffeeShopItemView: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var reviewLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCoffeeShopItemView(coffeeShop: CoffeeShop) {
        self.nameLabel.text = coffeeShop.name
        self.reviewLabel.text = coffeeShop.review
        self.ratingLabel.text = "\("Rating: ") \(String(coffeeShop.rating))"
        self.layoutIfNeeded()
    }
}
