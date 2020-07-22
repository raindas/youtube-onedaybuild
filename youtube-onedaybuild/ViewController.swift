//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by President Raindas on 21/07/2020.
//  Copyright © 2020 Raindas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }


}

