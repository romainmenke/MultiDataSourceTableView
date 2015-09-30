//
//  SubSection.swift
//  MultiDataSourceTableViews
//
//  Created by Romain Menke on 01/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

class SubSectionViewController: SSTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func cellIdentifier(tableView: UITableView, indexPath: NSIndexPath) -> String {
        return "Cell"
    }
    
    override func numberOfSections(tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func numberOfSubSections(tableView: UITableView, section: Int) -> Int {
        return 3
    }
    
    override func numberOfRowsInSection(tableView: UITableView, subSection: Int, section: Int) -> Int {
        return 2
    }
    
    override func cellForRowInSubSectionOfSection(tableview: UITableView, cell: UITableViewCell, section: Int, subSection: Int, row: Int) -> UITableViewCell {
        cell.textLabel!.text = "section : \(section)   |   subsection : \(subSection)   |   row : \(row)"
        
        return cell
    }
    
    
}