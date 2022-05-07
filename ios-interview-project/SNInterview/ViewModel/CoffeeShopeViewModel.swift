//
//  CoffeeShopeViewModel.swift
//  SNInterview
//
//  Created by Vishal22 Sharma on 07/05/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

class CoffeeShopeViewModel: NSObject {
    
    var coffeeShopes: [CoffeeShop] = []
    
    func getCoffeeShopList(fileName: String, completion: @escaping((Bool) -> Void)) {
       let decoder = JSONDecoder()
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let coffeeShopes = try? decoder.decode([CoffeeShop].self, from: data)
       else {
         return completion(false)
       }
        self.coffeeShopes = coffeeShopes
        completion(true)
    }
}
