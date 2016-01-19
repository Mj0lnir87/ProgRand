import UIKit

class ProgressionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var styleBarsLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    //@IBOutlet weak var noteField: UICollectionView!
    
    var style: Style!
    var model = StyleModel()
    
    var majorSharps: [String] = []
    var majorFlats: [String] = []
    var minorSharps: [String] = []
    var minorFlats: [String] = []
    
    var chords: [String] = []
    var progression: [String] = []
    
    var majorOrMinor: String!
    
    //var savedProgressions: [Style]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = style.styleName
        //savedProgressions = [Style]()
        
        styleBarsLabel.text = Int(style.styleBars).description
        
        devideMajorMinorKeyArray(style)
        
        if style.majorKey{
            keyLabel.text = style.keyNote
            defineMajorScale(style)
            majorOrMinor = "Major"
        } else {
            keyLabel.text = style.keyNote + "m"
            defineMinorScale(style)
            majorOrMinor = "Minor"
        }
        
        print("\(style.styleName)" + " \(style.styleBars)" + " \(style.keyNote) " +  majorOrMinor + "\n" + chords.description + "\n")
        progression(style)
        print("Major #'s: " + majorSharps.description + "\n"
            + "Major b's: " + majorFlats.description + "\n"
            + "Minor #'s: " + minorSharps.description + "\n"
            + "Minor b's: " + minorFlats.description + "\n"
            + ":----____----____----: \n")
        
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
        cell.styleName.text = progression[indexPath.item]
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
        chords = majorScale
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
        chords = minorScale
    }
    
    // Randomize the progression
    func progression(style: Style){
        let chordNumbers: [String] = ["6", "7", "9", "11", "13" ,"" , "" ,"" ]
        switch style.styleName{
            case "Jazz":
                progression.append(chords[1])
                progression.append(chords[4])
                progression.append(chords[0])
                progression.append(chords[0])
                for var i = 0; i < 2 ;++i{
                    progression.append(chords[1] + chordNumbers.randomize()!)
                    progression.append(chords[4] + chordNumbers.randomize()!)
                    progression.append(chords[0] + chordNumbers.randomize()!)
                    progression.append(chords[0] + chordNumbers.randomize()!)
                    for var j = 0; j < 4; ++j{
                        progression.append(chords.randomize()! + chordNumbers.randomize()!)
                    }
                }
            case "Blues":
                progression.append(chords[0])
                progression.append(chords[0])
                progression.append(chords[0] + chordNumbers.randomize()!)
                progression.append(chords[0] + chordNumbers.randomize()!)
                progression.append(chords[3])
                progression.append(chords[3])
                progression.append(chords[0])
                progression.append(chords[0])
                progression.append(chords[4])
                progression.append(chords[3])
                progression.append(chords[0] + chordNumbers.randomize()!)
                progression.append(chords[4] + chordNumbers.randomize()!)
                for var i = 0; i < 8; ++i{
                    progression.append(chords.randomize()! + chordNumbers.randomize()!)
                }
            
            case "Hard Rock":
                for var i = 0; i < style.styleBars; ++i{
                    progression.append(chords.randomize()!)
                }
            
            default:
                for var i = 0; i < style.styleBars; ++i{
                    progression.append(chords.randomize()! + chordNumbers.randomize()!)
                }
        }
        
        for i in 0 ... style.styleBars-1{
            style.chordProgression.append(progression[i])
        }
        
        print(style.styleName + "-progresson: ( " + style.chordProgression.count.description + " chords)" + style.chordProgression.description + "\n")
    }
    
    @IBAction func saveProgression(sender: AnyObject?) {
        let alertPopup = UIAlertController(title: "New Progression", message: "Enter a progressionname", preferredStyle: .Alert)
        
        let save = UIAlertAction(title: "Save", style: .Default, handler: {(action: UIAlertAction) -> Void in
                let textField = alertPopup.textFields!.first
            self.style.styleName = textField!.text!
            //self.savedProgressions.append(self.style)
            let savedProgressionsData = NSKeyedArchiver.archivedDataWithRootObject(self.style)
            NSUserDefaults.standardUserDefaults().setObject(savedProgressionsData, forKey: "progressions:")
            
            print("Succesfully saved a progression!")
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .Default) {
            (action: UIAlertAction) -> Void in
        }
        
        alertPopup.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
        }
        
        alertPopup.addAction(save)
        alertPopup.addAction(cancel)
        
        presentViewController(alertPopup, animated: true, completion: nil)
    }

}

//To restart the MajorMinor().sharps or MajorMinor().flats array when 'Array index out of range' error is thrown!
extension Array{
    func indexOutOfRange(index:Int) -> Element? {
        return index < count && index >= 0 ? self[index] : nil
    }
    
    func randomize() -> Element?{
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}