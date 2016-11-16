//
//  RecipeTableViewController.swift
//  Whip It Up!
//
//  Created by Kory E King on 11/16/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController, UISearchBarDelegate {

    var jsonParse = F2FJsonParser()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParse.search("")
        
        jsonParse.mReicpeList.removeAtIndex(0)
        
        self.tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "search e.g. eggs"
        searchController.searchBar.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
        return jsonParse.mReicpeList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rlistcell", forIndexPath: indexPath) as! CustomTBVCell
        let recipe = jsonParse.mReicpeList[indexPath.row]
        let rImg = jsonParse.imgList[recipe["id"]!]
        cell.rectitle.text = recipe[mCONSTANTS.mashape.resultsKey.title]
        cell.time.text = "Ready in: "
        let time = recipe[mCONSTANTS.mashape.resultsKey.readyMin]! as String
        cell.time.text?.appendContentsOf("\(time) mins")
        cell.recimage.image = rImg
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
 
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYOffset = scrollView.contentOffset.y
        let distFromBot = scrollView.contentSize.height - contentYOffset
        
        if(distFromBot < height){
            //jsonParse.loadNextPage()
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        jsonParse.mReicpeList.removeAll()
        jsonParse.search(searchBar.text!)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let recipe = jsonParse.mReicpeList[indexPath.row]
        let id = recipe["id"]
        
        
        let recipeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("recipeVC") as! RecipeViewController
        
        recipeVC.id = id!
        recipeVC.recipeImage.image = jsonParse.imgList[id!]
        
        showViewController(recipeVC, sender: self)
    }
    

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
}
