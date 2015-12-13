//
//  MainVCViewController.swift
//  SegmentedSearch
//
//  Created by Hardik on 13/12/15.
//  Copyright © 2015 HDG. All rights reserved.
//

import UIKit

class MainVCViewController: UIViewController {

    // MARK: - Memory Managment methods
    
    // ---------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ---------------------------------------------------------------------
    
    deinit {
        
    }
    
    // ---------------------------------------------------------------------
    
    // MARK: - Custom methods
    
    // ---------------------------------------------------------------------
    
    func baseSetup() {
      
    }

    @IBAction func btnClicked(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("SearchVC") as! ViewController
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.translucent = false
        vc.arrColors = ["Red","Green","Blue","Black","Yellow","Orange","Purple","Brown","Gray","Pink"]
        self.presentViewController(navigationController, animated: true, completion: nil)

    }
    
    // ---------------------------------------------------------------------
    
    // MARK: - Life cycle methods
    
    // ---------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.baseSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // ---------------------------------------------------------------------

}
