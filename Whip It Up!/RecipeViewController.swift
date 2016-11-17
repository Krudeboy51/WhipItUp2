//
//  RecipeViewController.swift
//  Whip It Up!
//
//  Created by Kory E King on 11/16/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var plate: UIImageView!
    var id = "1234"
    
    var jsonParserDetail = MashapeJsonParser()
    var recipe = RecipeModel()
    
    
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if recipe.title != nil{
            recipeTitle.text = recipe.title
        }
        if image != nil{
            plate.image = image
        }

    //    self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func ingredients(sender: AnyObject) {
        let ingredientVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ingredients") as! IngredientsTBVC
        ingredientVC.recipe = recipe
        showViewController(ingredientVC, sender: self)
    }

    @IBAction func instructions(sender: AnyObject) {
        let instructVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("instruct") as! instructionVC
        if recipe.instructions != nil{
            instructVC.instructions = recipe.instructions
        }
        showViewController(instructVC, sender: self)
    }
}










        /*
 
        if recipe.instructions != nil{
            let ins = recipe.instructions?.stringByReplacingOccurrencesOfString(".", withString: "\n")
            recipeinstructions.text = ins
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
    }*/
    
 