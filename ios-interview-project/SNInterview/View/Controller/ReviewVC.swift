//
//  ReviewVC.swift
//  SNInterview
//
//  Created by Vishal22 Sharma on 07/05/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

class ReviewVC: UIViewController {
    
    @IBOutlet weak var reviewLabel: UILabel!
    var reviewString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.reviewLabel.text = reviewString
    }
    // MARK: - Close button action
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}
