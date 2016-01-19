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
        var majorSharps: [String] = []
        var majorFlats: [String] = []
        var minorSharps: [String] = []
        var minorFlats: [String] = []
        
        var majorScale: [String] = []
        
        // devide MajorMinor arrays in 2 and plase first half in new array to see if it is a part of the sharps of the flats
        let majorMinorCount = MajorMinor().major.count //Major and Minor contain an equal amount of notes, ALWAYS!
        
        let rootNoteIndex = MajorMinor().sharps.indexOf(style.keyNote)
        
        for var i = 0; i < majorMinorCount; ++i{
            if i < majorMinorCount/2{
                majorSharps.append(MajorMinor().major[i])
                minorSharps.append(MajorMinor().minor[i])
            } else {
                majorFlats.append(MajorMinor().major[i])
                minorFlats.append(MajorMinor().minor[i])
            }
        }
        
        print("Major #'s: " + majorSharps.description)
        print("Major b's: " + majorFlats.description)
        print("Minor #'s: " + minorSharps.description)
        print("Minor b's: " + minorFlats.description)
        
        
        //defining the major scales
        if majorSharps.contains(style.keyNote){
            majorScale.append(style.keyNote)
            if (MajorMinor().sharps.indexOutOfRange(rootNoteIndex! + 2)) == nil{
                majorScale.append(MajorMinor().sharps[2])
            }
            
        }
        
        print("Major Scale " + majorScale.description)
    }

}

//To restart the MajorMinor().sharps or MajorMinor().flats array when 'Array index out of range' error is thrown!
extension Array{
    func indexOutOfRange(index:Int) -> Element? {
        return index < count && index >= 0 ? self[index] : nil
    }
}