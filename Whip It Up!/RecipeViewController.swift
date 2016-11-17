//
//  RecipeViewController.swift
//  Whip It Up!
//
//  Created by Kory E King on 11/16/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipecooktime: UILabel!
    @IBOutlet weak var recipepreptime: UILabel!
    @IBOutlet weak var recipetitle: UILabel!
    @IBOutlet weak var recipeinstructions: UILabel!
    @IBOutlet weak var tbView: UITableView!
    
    var id = "1234"
    var rectitle : String!
    
    var jsonParserDetail = MashapeJsonParser()
    var recipe = RecipeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipe = jsonParserDetail.getData(id)
        print("RECTITLE: \(id)")
        self.automaticallyAdjustsScrollViewInsets = false
        
        //recipepreptime.text = jsonParserDetail.recipe.recipepreptime
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if rectitle != ""{
            recipetitle.text = rectitle
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredients:"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingcell", forIndexPath: indexPath)
        
        //cell.textLabel?.text = jsonParserDetail.recipe.ingredients[indexPath.row].name
        cell.detailTextLabel?.text = "info"
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
