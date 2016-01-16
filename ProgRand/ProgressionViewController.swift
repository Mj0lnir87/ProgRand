import UIKit

class ProgressionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var styleBarsLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var noteField: UICollectionView!
    
    var style: Style!
    
    // temporary chords, not final!
    var chords: [String] = ["A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = style.styleName
        
        styleBarsLabel.text = Int(style.styleBars).description
        
        if style.majorKey == false{
            keyLabel.text = style.keyNote + "m"
        } else {
            keyLabel.text = style.keyNote
        }
        
        something(style)
        
        print("\(style.styleName)" + " \(style.styleBars)" + " \(style.keyNote)" + " Major: \(style.majorKey)")
        
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
        cell.styleName.text = chords[indexPath.item]
        return cell
    }
    
    func something(style: Style){
        var majorFirstPart: [String] = []
        var majorLastPart: [String] = []
        var minorFirstPart: [String] = []
        var minorLastPart: [String] = []
        
        // devide MajorMinor arrays in 2 and plase first half in new array to see if it is a part of the sharps of the flats
        let majorCount = MajorMinor().major.count
        for var i = 0; i < majorCount; ++i{
            if i < majorCount/2{
                majorFirstPart.append(MajorMinor().major[i])
            } else {
                majorLastPart.append(MajorMinor().major[i])
            }
        }
        
        let minorCount = MajorMinor().minor.count
        for var i = 0; i < minorCount; ++i{
            if i < minorCount/2{
                minorFirstPart.append(MajorMinor().minor[i])
            } else {
                minorLastPart.append(MajorMinor().minor[i])
            }
        }
        
        print("Major First: " + majorFirstPart.description)
        print("Major Last: " + majorLastPart.description)
        print("Minor First: " + minorFirstPart.description)
        print("Minor Last: " + minorLastPart.description)
        
        // define the scales!
        var majorScale: [String] = []
        if style.majorKey == true && majorFirstPart.contains(style.keyNote){
            majorScale = [] // Continue here!
        }
    }
    
}