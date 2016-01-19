import UIKit

class ProgressionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var styleBarsLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var noteField: UICollectionView!
    
    var style: Style!
    
    var majorSharps: [String] = []
    var majorFlats: [String] = []
    var minorSharps: [String] = []
    var minorFlats: [String] = []
    
    // temporary chords, not final!
    var chords: [String] = ["A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M", "A", "Bbm", "Cb", "F#M"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = style.styleName
        
        styleBarsLabel.text = Int(style.styleBars).description
        
        devideMajorMinorKeyArray(style)
        
        if style.majorKey{
            keyLabel.text = style.keyNote
            defineMajorScale(style)
        } else {
            keyLabel.text = style.keyNote + "m"
            defineMinorScale(style)
        }
        
        
        
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
    
    // devide MajorMinor arrays in 2 and plase first half in new array to see if it is a part of the sharps of the flats
    func devideMajorMinorKeyArray(style: Style){
        
        let majorMinorCount = MajorMinor().major.count //Major and Minor contain an equal amount of notes, ALWAYS!
        
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
    }
    
    //defining the major scales
    func defineMajorScale(style: Style){
        var majorScale: [String] = []
        majorScale.append(style.keyNote)
        
        var currentNote = style.keyNote
        
            if majorSharps.contains(style.keyNote){
                
                var noteIndex = MajorMinor().sharps.indexOf(currentNote)
                
                if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[0] + "m")
                    currentNote = MajorMinor().sharps[0]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                    
                } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[1] + "m" )
                    currentNote = MajorMinor().sharps[1]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().sharps[noteIndex! + 2]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                }
                
                
                if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[0] + "m")
                    currentNote = MajorMinor().sharps[0]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                    
                } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[1] + "m")
                    currentNote = MajorMinor().sharps[1]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().sharps[noteIndex! + 2]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                }
                
                
                if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[0])
                    currentNote = MajorMinor().sharps[0]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                    
                } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[0])
                    currentNote = MajorMinor().sharps[0]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                } else {
                
                    majorScale.append(MajorMinor().sharps[noteIndex! + 1])
                    currentNote = MajorMinor().sharps[noteIndex! + 1]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                }
                
                
                if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[0])
                    currentNote = MajorMinor().sharps[0]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                    
                } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[1])
                    currentNote = MajorMinor().sharps[1]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                } else {
                
                    majorScale.append(MajorMinor().sharps[noteIndex! + 2])
                    currentNote = MajorMinor().sharps[noteIndex! + 2]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                }
                
                
                if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[0] + "m")
                    currentNote = MajorMinor().sharps[0]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                    
                } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[1] + "m")
                    currentNote = MajorMinor().sharps[1]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                } else {
                
                    majorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().sharps[noteIndex! + 2]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                }
                
                
                if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[0] + "m")
                    currentNote = MajorMinor().sharps[0]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                    
                } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().sharps[1] + "m")
                    currentNote = MajorMinor().sharps[1]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                } else {
                
                    majorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().sharps[noteIndex! + 2]
                    noteIndex = MajorMinor().sharps.indexOf(currentNote)
                }
            } else {
                
                if currentNote == "Cb" {
                    currentNote = "B"
                }
                
                var noteIndex = MajorMinor().flats.indexOf(currentNote)
                
                if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().flats[0] + "m")
                    currentNote = MajorMinor().flats[0]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                    
                } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().flats[1] + "m")
                    currentNote = MajorMinor().flats[1]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().flats[noteIndex! + 2]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                }
                
                
                if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().flats[0] + "m")
                    currentNote = MajorMinor().flats[0]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                    
                } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().flats[1] + "m")
                    currentNote = MajorMinor().flats[1]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().flats[noteIndex! + 2]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                }
                
                
                if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().flats[0])
                    currentNote = MajorMinor().flats[0]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                    
                } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().flats[0])
                    currentNote = MajorMinor().flats[0]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().flats[noteIndex! + 1])
                    currentNote = MajorMinor().flats[noteIndex! + 1]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                }
                
                
                if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().flats[0])
                    currentNote = MajorMinor().flats[0]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                    
                } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().flats[1])
                    currentNote = MajorMinor().flats[1]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().flats[noteIndex! + 2])
                    currentNote = MajorMinor().flats[noteIndex! + 2]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                }
                
                
                if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().flats[0] + "m")
                    currentNote = MajorMinor().flats[0]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                    
                } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().flats[1] + "m")
                    currentNote = MajorMinor().flats[1]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().flats[noteIndex! + 2]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                }
                
                
                if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                    
                    majorScale.append(MajorMinor().flats[0] + "m")
                    currentNote = MajorMinor().flats[0]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                    
                } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                    
                    majorScale.append(MajorMinor().flats[1] + "m")
                    currentNote = MajorMinor().flats[1]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                } else {
                    
                    majorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                    currentNote = MajorMinor().flats[noteIndex! + 2]
                    noteIndex = MajorMinor().flats.indexOf(currentNote)
                }
            }
        
        print("Major Scale " + majorScale.description)
    }
    
    //defining the minor scales
    func defineMinorScale(style: Style){
        var minorScale: [String] = []
        minorScale.append(style.keyNote + "m")
        
        var currentNote = style.keyNote
        
        if minorSharps.contains(style.keyNote){
            
            var noteIndex = MajorMinor().sharps.indexOf(currentNote)
            
            if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().sharps[0] + "m")
                currentNote = MajorMinor().sharps[0]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
                
            } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().sharps[1] + "m" )
                currentNote = MajorMinor().sharps[1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                currentNote = MajorMinor().sharps[noteIndex! + 2]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            }
            
            
            if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 1])
                currentNote = MajorMinor().sharps[noteIndex! + 1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
                
            } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().sharps[0])
                currentNote = MajorMinor().sharps[0]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 1])
                currentNote = MajorMinor().sharps[noteIndex! + 1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            }
            
            
            if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().sharps[0] + "m")
                currentNote = MajorMinor().sharps[0]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
                
            } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().sharps[1] + "m")
                currentNote = MajorMinor().sharps[1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                currentNote = MajorMinor().sharps[noteIndex! + 2]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            }
            
            
            if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().sharps[0] + "m")
                currentNote = MajorMinor().sharps[0]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
                
            } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().sharps[1] + "m")
                currentNote = MajorMinor().sharps[1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                currentNote = MajorMinor().sharps[noteIndex! + 2]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            }
            
            
            if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 1])
                currentNote = MajorMinor().sharps[noteIndex! + 1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
                
            } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().sharps[0])
                currentNote = MajorMinor().sharps[0]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 1])
                currentNote = MajorMinor().sharps[noteIndex! + 1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            }
            
            
            if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().sharps.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().sharps[0] + "m")
                currentNote = MajorMinor().sharps[0]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
                
            } else if (MajorMinor().sharps.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().sharps[1] + "m")
                currentNote = MajorMinor().sharps[1]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().sharps[noteIndex! + 2] + "m")
                currentNote = MajorMinor().sharps[noteIndex! + 2]
                noteIndex = MajorMinor().sharps.indexOf(currentNote)
            }
        } else {
            
            if currentNote == "Cb" {
                currentNote = "B"
            }
            
            var noteIndex = MajorMinor().flats.indexOf(currentNote)
            
            if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().flats[0] + "m")
                currentNote = MajorMinor().flats[0]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
                
            } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().flats[1] + "m")
                currentNote = MajorMinor().flats[1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                currentNote = MajorMinor().flats[noteIndex! + 2]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            }
            
            
            if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 1])
                currentNote = MajorMinor().flats[noteIndex! + 1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
                
            } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().flats[0])
                currentNote = MajorMinor().flats[0]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 1])
                currentNote = MajorMinor().flats[noteIndex! + 1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            }
            
            
            if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().flats[0] + "m")
                currentNote = MajorMinor().flats[0]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
                
            } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().flats[1] + "m")
                currentNote = MajorMinor().flats[1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                currentNote = MajorMinor().flats[noteIndex! + 2]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            }
            
            
            if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().flats[0] + "m")
                currentNote = MajorMinor().flats[0]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
                
            } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().flats[1] + "m")
                currentNote = MajorMinor().flats[1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                currentNote = MajorMinor().flats[noteIndex! + 2]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            }
            
            
            if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 1])
                currentNote = MajorMinor().flats[noteIndex! + 1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
                
            } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().flats[0])
                currentNote = MajorMinor().flats[0]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 1])
                currentNote = MajorMinor().flats[noteIndex! + 1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            }
            
            
            if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) != nil && (MajorMinor().flats.indexOutOfRange(noteIndex! + 2)) == nil {
                
                minorScale.append(MajorMinor().flats[0] + "m")
                currentNote = MajorMinor().flats[0]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
                
            } else if (MajorMinor().flats.indexOutOfRange(noteIndex! + 1)) == nil {
                
                minorScale.append(MajorMinor().flats[1] + "m")
                currentNote = MajorMinor().flats[1]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            } else {
                
                minorScale.append(MajorMinor().flats[noteIndex! + 2] + "m")
                currentNote = MajorMinor().flats[noteIndex! + 2]
                noteIndex = MajorMinor().flats.indexOf(currentNote)
            }
        }
        
        print("Minor Scale " + minorScale.description)
    }

}

//To restart the MajorMinor().sharps or MajorMinor().flats array when 'Array index out of range' error is thrown!
extension Array{
    func indexOutOfRange(index:Int) -> Element? {
        return index < count && index >= 0 ? self[index] : nil
    }
}