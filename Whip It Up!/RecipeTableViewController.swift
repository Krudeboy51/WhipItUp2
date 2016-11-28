//
//  RecipeTableViewController.swift
//  Whip It Up!
//
//  Created by Kory E King on 11/16/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController, UISearchBarDelegate {

    let searchController = UISearchController(searchResultsController: nil)
    var recipeCollection = RecipeCollection()
    var recipeList = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "search e.g. eggs"
        searchController.searchBar.delegate = self
        
        recipeCollection.getRandom(){
            (recipes) in
            self.recipeList = recipes
            self.tableView.reloadData()
        }
        
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(self.showHome)), animated: true)

        //recipeCollection.
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
        return recipeList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rlistcell", forIndexPath: indexPath) as! CustomTBVCell
        let recipe = recipeList[indexPath.row]
        let rImg = recipeCollection.imgList[recipe["id"]!]
        cell.rectitle.text = recipe[Constants.resultsKey.title]
        cell.time.text = "Ready in: "
        let time = recipe[Constants.resultsKey.readyMin]! as String
        cell.time.text?.appendContentsOf("\(time) mins")
        cell.recimage.image = rImg
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
 
    /*
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYOffset = scrollView.contentOffset.y
        let distFromBot = scrollView.contentSize.height - contentYOffset
        
        if(distFromBot < height){
            //jsonParse.loadNextPage()
            self.tableView.reloadData()
        }
    }*/
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
       // print("SEARCH BAR: LIST SIZE: \(self.recipeCollection.mReicpeList.count)")
        recipeCollection.search(searchBar.text!){
            (recipes) in
            self.recipeList = recipes
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let recipeV = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("rcpVC") as! recipeVC
        
        let recipe = recipeList[indexPath.row]
        let id = recipe["id"]!
        let recipeDetail = MashapeJsonParser()
        recipeDetail.getData(id)
        let rec = recipeDetail.recipe
        
        recipeV.recipe.title = recipeDetail.recipe.title
        recipeV.recipe.cookmin = rec.cookmin
        recipeV.recipe.ingredients = rec.ingredients
        recipeV.recipe.prepMin = rec.prepMin
        recipeV.recipe.servings = rec.servings
        recipeV.image = recipeCollection.imgList[id]
        var instruction = rec.instructions?.stringByReplacingOccurrencesOfString(".", withString: "\n\n")
        instruction = instruction?.stringByReplacingOccurrencesOfString("<li>", withString: "\n\n\t")
        recipeV.recipe.instructions = instruction
        
        
        //print("MRECIPE: \(rec.title)")
 
        showViewController(recipeV, sender: self)
    }
    
    func showHome(){
        let menuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("mainmenu") as! MainViewController
        showViewController(menuVC, sender: self)
    }

}
