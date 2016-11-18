//
//  recipeImageFullVC.swift
//  Whip It Up!
//
//  Created by user119166 on 11/18/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class recipeImageFullVC: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        if image != nil{
            mainImage.image = image
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
