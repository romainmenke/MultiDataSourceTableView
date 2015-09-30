#MultiDataSourceTableView

**Auto insert extra rows every x regular rows.**

This allows you to have two 2D arrays as a datasource. The ViewController has two functions for fetching cells, both give you a row and section relative to their data.

Limitation :
Seconds source data needs to be a multiple of the first, both in regard to sections as rows.
This is because the second cells get inserted after x number of "regular" cells.

Some extra functions:

set where and how many times the second source gets inserted

`override func insertXRowsEveryYSections(section: Int) -> (numberOfRows: Int, afterSoManyRows: Int)`

first source cells
    
`override func dataCellForRowAtIndexPath(cell: UITableViewCell, section: Int, row: Int) -> UITableViewCell`

second source cells
    
`override func insertionCellForRowAtIndexPath(cell: UITableViewCell, section: Int, row: Int) -> UITableViewCell`




**Add a subsections**

Virtualy create a 3D array of rows. (speaks for itself ;) )

`func numberOfSections(tableView: UITableView) -> Int`
    
`func numberOfSubSections(tableView: UITableView, section: Int) -> Int`
    
`func numberOfRowsInSection(tableView: UITableView, subSection: Int, section: Int) -> Int`
    
`func cellForRowInSubSectionOfSectiontableView(tableview: UITableView, cell: UITableViewCell, section: Int, subSection: Int, row: Int) -> UITableViewCell`
