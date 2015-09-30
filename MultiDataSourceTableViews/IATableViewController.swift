//
//  IATableViewController.swift
//  MultiDataSourceTableViews
//
//  Created by Romain Menke on 30/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

// Insert Auto TableViewController

class IATableViewController: UITableViewController {
    
    private var adapters : [[cellAdapter]] = []
    
    private struct cellAdapter {
        var isDataCell : Bool = true
        var indexPath : NSIndexPath = NSIndexPath()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cellIdentifier(tableView: UITableView, isDataCell: Bool) -> String {
        return "Cell"
    }
    
    
    func numberOfSections(tableView: UITableView) -> Int {
        return 0
    }
    
    func numberOfRowsInSection(tableView: UITableView, section: Int) -> Int {
        return 0
    }
    
    func insertXRowsEveryYSections(tableView: UITableView, section: Int) -> (numberOfRows:Int, afterSoManyRows:Int) {
        return (numberOfRows:0, afterSoManyRows:0)
    }
    
    internal override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        let sections = numberOfSections(tableView)
        
        adapters = []
        
        for _ in 0..<sections {
            adapters.append([])
        }
        
        return sections
    }
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let rows = numberOfRowsInSection(tableView, section: section)
        
        adapters[section] = []
        
        for row in 0..<rows {
            var adapter = cellAdapter()
            adapter.indexPath = NSIndexPath(forRow: row, inSection: section)
            adapter.isDataCell = true
            adapters[section].append(adapter)
        }
        
        insertion(tableView, section: section)
        
        return adapters[section].count
    }
    
    private func insertion(tableView: UITableView, section: Int) {
        
        let insertRowEvery = insertXRowsEveryYSections(tableView, section: section)
        let insertionPoint = insertRowEvery.afterSoManyRows
        let insertionTimes = insertRowEvery.numberOfRows
        
        var counter = 0
        
        var startArray = adapters[section]
        var insertionArray: [cellAdapter] = []
        
        while !startArray.isEmpty {
            
            if startArray.count > (insertionPoint - 1) {
                
                for _ in 0..<insertionPoint {
                    insertionArray.append(startArray.removeFirst())
                }
                for _ in 0..<insertionTimes {
                    var adapter = cellAdapter()
                    adapter.indexPath = NSIndexPath(forRow: counter, inSection: section)
                    adapter.isDataCell = false
                    insertionArray.append(adapter)
                    counter += 1
                }
            } else {
                insertionArray += startArray
                startArray = []
            }
        }
        
        adapters[section] = insertionArray
        
    }
    
    
    func insertionCellForRowAtIndexPath(tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    func dataCellForRowAtIndexPath(tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        
        return cell
        
    }
    
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let adapter = adapters[indexPath.section][indexPath.row]
        
        let identifier = cellIdentifier(tableView, isDataCell: adapter.isDataCell)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        switch adapter.isDataCell {
        case true :
            return dataCellForRowAtIndexPath(tableView, cell: cell, indexPath: adapter.indexPath)
        case false :
            return insertionCellForRowAtIndexPath(tableView, cell: cell, indexPath: adapter.indexPath)
        }
        
        
    }
}