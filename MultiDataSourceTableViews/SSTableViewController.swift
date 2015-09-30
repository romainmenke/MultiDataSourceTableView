//
//  AATableViewController.swift
//  MultiDataSourceTableViews
//
//  Created by Romain Menke on 30/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

// TableViewController with three levels of rows

class SSTableViewController: UITableViewController {
    
    
    private var adapters : [[subSectionAdapter]] = []
    
    private struct subSectionAdapter {
        var section : Int = 0
        var subSection : Int = 0
        var row : Int = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cellIdentifier(tableView: UITableView, indexPath : NSIndexPath) -> String {
        return "Cell"
    }
    
    func numberOfSections(tableView: UITableView) -> Int {
        return 0
    }
    
    func numberOfSubSections(tableView: UITableView, section : Int) -> Int {
        return 0
    }
    
    func numberOfRowsInSection(tableView: UITableView, subSection: Int, section: Int) -> Int {
        return 0
    }
    
    
    internal override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        let superSections : Int = numberOfSections(tableView)
        
        adapters = []
        
        for _ in 0..<superSections {
            
            adapters.append([])
            
        }
        
        return superSections
    }
    
    
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let subSections = numberOfSubSections(tableView, section: section)
        
        adapters[section] = []
        
        for subSection in 0..<subSections {
            
            let rows = numberOfRowsInSection(tableView, subSection: subSection, section: section)
            
            for row in 0..<rows {
                
                let adapter = subSectionAdapter(section: section, subSection: subSection, row: row)
                adapters[section].append(adapter)
                
            }
            
        }

        return adapters[section].count
    }

    func cellForRowInSubSectionOfSection(tableview: UITableView, cell: UITableViewCell, section: Int, subSection: Int, row: Int) -> UITableViewCell {
        
        // Configure the cell...
        
        return cell
        
    }
    
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = cellIdentifier(tableView, indexPath: indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        // Configure the cell...
        let adapter = adapters[indexPath.section][indexPath.row]
        
        let section = adapter.section
        let subSection = adapter.subSection
        let row = adapter.row
        
        return cellForRowInSubSectionOfSection(tableView, cell: cell, section: section, subSection: subSection, row: row)
        
    }
}




