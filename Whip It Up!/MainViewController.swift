//
//  MainViewController.swift
//  Whip It Up!
//
//  Created by user119166 on 11/23/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UISplitViewControllerDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func search(sender: AnyObject) {
        
        /*
 
         var appDelegateTemp = UIApplication.shared.delegate!
         appDelegateTemp.window!.rootViewController! = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()

 */
        let appDelegateTemp = UIApplication.sharedApplication().delegate!
        
        let splitViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("splitVC") as? UISplitViewController
        
        
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.PrimaryOverlay
        
        splitViewController?.delegate = self
        
        let containerViewController : ContainerViewController = ContainerViewController()
        containerViewController.setEmbeddedViewController(splitViewController)
        
        appDelegateTemp.window!!.rootViewController = containerViewController
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
    }
     /*
    func targetDisplayModeForActionInSplitViewController(svc: UISplitViewController) -> UISplitViewControllerDisplayMode {
        return UISplitViewControllerDelegate.
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
