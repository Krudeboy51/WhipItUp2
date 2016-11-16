//
//  ViewController.swift
//  Whip It Up!
//
//  Created by Kory E King on 11/16/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var jsonParser = F2FJsonParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParser.search("")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadnxt(sender: AnyObject) {
        jsonParser.loadNextPage()
    }

}

