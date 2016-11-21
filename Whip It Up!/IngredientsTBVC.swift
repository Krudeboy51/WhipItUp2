//
//  IngredientsTBVC.swift
//  Whip It Up!
//
//  Created by Kory E King on 11/17/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class IngredientsTBVC: UITableViewController {
    
    var recipe = RecipeModel()
    var checkedItems = Array<Bool>()
    var mappedItem = UIBarButtonItem()
    var isChecked = false

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in recipe.ingredients{
            checkedItems.append(false)
        }
        
        let button = UIButton.init(type: UIButtonType.Custom)
        //set image for button
        button.setImage(UIImage(named: "fb.png"), forState: UIControlState.Normal)
        //add function for button
        button.addTarget(self, action: "fbButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRectMake(0, 0, 53, 31)
        
        mappedItem = UIBarButtonItem(customView: button)
        
        print(checkedItems)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipe.ingredients.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingcell", forIndexPath: indexPath)

        cell .textLabel?.text = recipe.ingredients[indexPath.row].info

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        
        
        if !checkedItems[indexPath.row]{
            cell?.accessoryType = .Checkmark
            checkedItems[indexPath.row] = true
        }else{
            cell?.accessoryType = .None
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
        
        if isChecked{
            self.navigationItem.rightBarButtonItem = mappedItem
        }else{
            self.navigationItem.rightBarButtonItem = .None
        }
        
    }
    
    func gotoMap(){
        print("finding local supermarket")
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
