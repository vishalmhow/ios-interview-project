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
    
//    func loadJson(forFilename fileName: String) -> NSDictionary? {
//
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            if let data = NSData(contentsOf: url) {
//                do {
//                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
//
//                    return dictionary
//                } catch {
//                    print("Error!! Unable to parse  \(fileName).json")
//                }
//            }
//            print("Error!! Unable to load  \(fileName).json")
//        }
//
//        return nil
//    }
}
