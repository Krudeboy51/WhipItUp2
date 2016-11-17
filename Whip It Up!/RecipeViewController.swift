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
    @IBOutlet weak var recipeserving: UILabel!
    @IBOutlet weak var tbView: UITableView!
    
    var id = "1234"
    
    var jsonParserDetail = MashapeJsonParser()
    var recipe = RecipeModel()
    
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParserDetail.getData(id)
        print("ID: \(id)")
        recipe = jsonParserDetail.recipe
        self.automaticallyAdjustsScrollViewInsets = false
        
        if recipe.title != nil{
            recipetitle.text = recipe.title
        }
        
        if recipe.instructions != nil{
            recipeinstructions.text = recipe.instructions
        }
        
        if recipe.cookmin != nil{
            recipecooktime.text = "Cook Time: \(recipe.cookmin!) mins"
        }else if recipe.cookmin! == 0{
            recipecooktime.hidden = true
        }
        
        if recipe.prepMin != nil{
            recipepreptime.text = "Prep Time: \(recipe.prepMin!) mins"
        }
        
        if recipe.servings != nil{
            recipeserving.text = "Serving: \(recipe.servings!)"
        }
        
        if image != nil{
            recipeImage.image = image
        }
        //recipepreptime.text = jsonParserDetail.recipe.recipepreptime
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredients:"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(recipe.ingredients.count > 0){
            return recipe.ingredients.count
        }else{
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingcell", forIndexPath: indexPath)
        
        let ingredient = recipe.ingredients[indexPath.row]
        
        cell.textLabel?.text = ingredient.info
        //cell.detailTextLabel?.text = ingredient.aisle
        
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
