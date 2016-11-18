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
    @IBOutlet weak var prepMin: UILabel!
    @IBOutlet weak var cookMin: UILabel!
    @IBOutlet weak var servings: UILabel!
    var id = "1234"
    
    var jsonParserDetail = MashapeJsonParser()
    var recipe = RecipeModel()
    
    @IBOutlet weak var ingredient: UIButton!
    @IBOutlet weak var instruction: UIButton!
    
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (recipe.title != nil) || (recipe.title != ""){
            recipeTitle.text = recipe.title
            if image != nil{
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(self.showImageFull(image)))
                plate.userInteractionEnabled = true
                plate.addGestureRecognizer(tapGestureRecognizer)
                plate.image = image
            }
            
            if recipe.cookmin != nil{
                cookMin.text = "Cook Time: \(recipe.cookmin!) mins"
            }
            
            if recipe.prepMin != nil{
                prepMin.text = "Preparation Time: \(recipe.prepMin!) mins"
            }
            
            if recipe.servings != nil{
                servings.text = "Serving Size: \(recipe.servings!)"
            }
            
            instruction.hidden = false
            ingredient.hidden = false
        }else{
            recipeTitle.text = "Please select a recipe from the menu"
            instruction.hidden = true
            ingredient.hidden = true
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
    
    func showImageFull(image : UIImage){
        let imageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("recipeImage") as! recipeImageFullVC
        imageVC.image = image
        showViewController(imageVC, sender: self)
    }
}










        /*
 
        if recipe.instructions != nil{
            let ins = recipe.instructions?.stringByReplacingOccurrencesOfString(".", withString: "\n")
            recipeinstructions.text = ins
        }
        
                if image != nil{
            recipeImage.image = image
        }
 
        //recipepreptime.text = jsonParserDetail.recipe.recipepreptime
        // Do any additional setup after loading the view.
    }*/
    
 
