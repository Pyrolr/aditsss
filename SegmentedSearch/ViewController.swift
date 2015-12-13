//
//  ViewController.swift
//  SegmentedSearch
//
//  Created by Hardik on 12/12/15.
//  Copyright © 2015 HDG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IBtblList: UITableView!
    @IBOutlet weak var IBsearchbar: UISearchBar!
    @IBOutlet weak var IBSegmentAddress: SegmentedControl!
   var arrColors = []
    var arrShapes = ["Circle","Square","Rectange","Triangle","Diamond","Star","Pentagon","Hexagon"]
    var arrFilteredItems = [String]()
    
    var filteredAppleProducts = [String]()
    var selectedFirst = ""
    var selectedSecond = ""
    
    // ---------------------------------------------------------------------
    
    // MARK: - Custom methods
    
    // ---------------------------------------------------------------------
    
    func baseSetup() {
        IBSegmentAddress.segmentItems.last!.enabled = false
        IBtblList.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func isFirstSelected() -> Bool {
        if selectedFirst.characters.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    
    @IBAction func addresssegmentValueChanged(sender: SegmentedControl) {
        if sender.selectedIndex == 1 && !isFirstSelected() {
            sender.selectedIndex = 0
        } else {
            IBsearchbar.text?.removeAll()
            arrFilteredItems.removeAll()
            IBtblList.reloadData()
        }

    }
    
    //---------------------------------------------------------------------
    
    // MARK: - Tableview delegate methods
    
    //---------------------------------------------------------------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if IBsearchbar.text?.characters.count > 0 {
            return arrFilteredItems.count
        } else  if IBSegmentAddress.selectedIndex == 1 {
            return arrShapes.count
        } else {
           return arrShapes.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as UITableViewCell?

        if IBsearchbar.text?.characters.count > 0 {
            cell!.textLabel?.text = arrFilteredItems[indexPath.row]
        } else if IBSegmentAddress.selectedIndex == 1 {
            cell!.textLabel?.text = arrShapes[indexPath.row]
        } else {
            cell!.textLabel?.text = arrColors[indexPath.row] as? String
        }
            return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
                IBSegmentAddress.segmentItems.last?.enabled = true
        if IBSegmentAddress.selectedIndex == 0 && IBsearchbar.text?.characters.count > 0 {
            selectedFirst = arrFilteredItems[indexPath.row]
        } else {
            selectedFirst  = arrColors[indexPath.row] as! String
        }
        
        if IBSegmentAddress.selectedIndex == 1 && IBsearchbar.text?.characters.count > 0 {
            selectedSecond = arrFilteredItems[indexPath.row]
        } else {
            selectedSecond  = arrShapes[indexPath.row]
        }
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRectMake(0,0, IBtblList.frame.size.width, 21))
        label.textAlignment = NSTextAlignment.Center
        label.text = "\(selectedFirst)"

        let hview = UIView()
        hview.backgroundColor = UIColor.whiteColor()
        hview.addSubview(label)
        return hview
    }

    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if IBSegmentAddress.selectedIndex == 0 {
            return 0
        } else {
            return 44
        }
    }
    
    //---------------------------------------------------------------------
    
    // MARK: - Searchbar delegate methods
    
    //---------------------------------------------------------------------
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        arrFilteredItems.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF BEGINSWITH[c] %@", IBsearchbar.text!)
        var arrActive = [String]()
        if IBSegmentAddress.selectedIndex == 0 {
            arrActive = arrColors as! [String]
        } else {
            arrActive = arrShapes
        }
        let array = (arrActive as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.arrFilteredItems = array as! [String]
        
        IBtblList.reloadData()
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

    // MARK: - Memory Managment methods
    
    // ---------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

