//
//  TaskDetailsViewController.swift
//  dost
//
//  Created by Margo T on 2017-02-14.
//  Copyright © 2017 margot. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let topTask = self.navigationController?.navigationBar.topItem {
            
            topTask.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        }
    }

    
    

}
