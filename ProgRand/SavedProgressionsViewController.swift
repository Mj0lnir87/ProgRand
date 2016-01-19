import UIKit

class SavedProgressonsViewController: UITableViewController{
    
    var savedProgressions: [Style] = []
    func loadProgressions(){
        let savedProgressionsData = NSUserDefaults.standardUserDefaults().objectForKey("progressions") as? NSData
        
        if let savedProgressionsData = savedProgressionsData{
            let savedProgressions = NSKeyedUnarchiver.unarchiveObjectWithData(savedProgressionsData) as? [Style]
            
            print(savedProgressions)
            
            self.savedProgressions = savedProgressions!
        }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedProgressions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("styleCell", forIndexPath: indexPath) as! StyleCellTableViewCell
        let style = savedProgressions[indexPath.row].styleName
        cell.styleName.text = "\(style)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let savedProgressionController = (segue.destinationViewController as! UINavigationController).topViewController as! savedProgressionViewController

        let selectedRow = tableView.indexPathForSelectedRow!.row
        let style = savedProgressions[selectedRow]
        savedProgressionController.style = style
    }
    
}
