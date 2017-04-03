//
//  MoreInfoDetailViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/21/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class MoreInfoDetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var item: MenuItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Display textView at the beginning.
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = item?.title
        textView.text = item?.info
    }
}
