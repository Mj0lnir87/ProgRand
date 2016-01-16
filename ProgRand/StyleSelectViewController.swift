import UIKit

class StyleSelectViewController: UITableViewController{
    
    var model = StyleModel()
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.styles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("styleCell", forIndexPath: indexPath) as! StyleCellTableViewCell
        let style = model.styles[indexPath.row]
        cell.styleName.text = "\(style)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailsController = segue.destinationViewController as! DetailsViewController
        let selectedRow = tableView.indexPathForSelectedRow!.row
        let selectedStyle = model.styles[selectedRow]
        detailsController.styleName = selectedStyle
    }    
    
}
