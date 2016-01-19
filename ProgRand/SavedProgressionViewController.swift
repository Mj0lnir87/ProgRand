import UIKit

class savedProgressionViewController: UIViewController{
    
    @IBOutlet weak var styleBarsLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var noteField: UICollectionView!
    
    var style: Style!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = style.styleName
        
        styleBarsLabel.text = Int(style.styleBars).description        
        
    }
    
    @IBAction func done(){
        performSegueWithIdentifier("done", sender: self)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return style.styleBars
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("styleCell", forIndexPath: indexPath) as! StyleCellCollectionViewCell
        cell.styleName.text = style.chordProgression[indexPath.item]
        return cell
    }
}