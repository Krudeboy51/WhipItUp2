//
//  recipeVC.swift
//  Whip It Up!
//
//  Created by user119166 on 11/22/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class recipeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var ingredientsTV: UITableView!
    @IBOutlet weak var plate: UIImageView!
    @IBOutlet weak var viewSwitcher: UISegmentedControl!
    
    @IBOutlet weak var cookTime: UILabel!
    @IBOutlet weak var prepMin: UILabel!
    @IBOutlet weak var title_L: UILabel!
    @IBOutlet weak var instructionTV: UITextView!
    
    @IBOutlet weak var shoppingCart: UIButton!
    var recipe = RecipeModel()
    var image: UIImage!
    
    var checkedItems = Array<Bool>()
    var mappedItem = UIBarButtonItem()
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSwitcher.selectedSegmentIndex = 0
        ingredientsTV.hidden = false
        instructionTV.hidden = true
        shoppingCart.hidden = true
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(self.saveRecipe)), animated: true)
        
        self.navigationItem.backBarButtonItem?.title = "Back"
        if image != nil{
            plate.image = image
        }
        
        if recipe.title != nil{
            title_L.text = recipe.title
        }
        
        if recipe.prepMin != nil{
            prepMin.text = "Prep time: \(recipe.prepMin) minutes"
        }
        
        if recipe.cookmin != nil{
            
            cookTime.text = "Cook time: \(recipe.cookmin) minutes"
        }
        
        if recipe.instructions != nil{
            instructionTV.text = recipe.instructions
        }
        
        for _ in recipe.ingredients{
            checkedItems.append(false)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchView(sender: UISegmentedControl) {
        switch viewSwitcher.selectedSegmentIndex{
        case 0:
            ingredientsTV.hidden = false
            instructionTV.hidden = true
        case 1:
            ingredientsTV.hidden = true
            instructionTV.hidden = false
        default: break
        }
    }
    
    @IBAction func goShopping(sender: AnyObject) {
        
    }
    
    func saveRecipe(){
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.ingredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = recipe.ingredients[indexPath.row].info
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        print("INDEX PATH: \(indexPath.row)")
        if !checkedItems[indexPath.row]{
            tableView.cellForRowAtIndexPath(indexPath)!.accessoryType = .Checkmark
            checkedItems[indexPath.row] = true
        }else{
            tableView.cellForRowAtIndexPath(indexPath)!.accessoryType = .None
            checkedItems[indexPath.row] = false
        }
        
        print(checkedItems)
        
        for i in checkedItems{
            if i {
                print("this should show a button linked to maps")
                isChecked = true
                break
            }else{
                isChecked = false
                
            }
        }
        
        shoppingCart.hidden = !isChecked
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
