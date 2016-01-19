import Foundation

class Style: NSObject{
    var styleName: String
    let styleBars: Int
    let majorKey: Bool
    let keyNote : String
    var chordProgression: [String]
    
    init(styleName:String, styleBars: Int, majorKey: Bool, keyNote: String, chordProgression: [String]){
        self.styleName = styleName
        self.styleBars = styleBars
        self.majorKey = majorKey
        self.keyNote = keyNote
        self.chordProgression = chordProgression
    }
    
    func encodeWithCoder(aCoder: NSCoder!){
        aCoder.encodeObject(styleName, forKey: "styleName")
        aCoder.encodeObject(styleBars, forKey: "styleBars")
        aCoder.encodeObject(majorKey, forKey: "majorKey")
        aCoder.encodeObject(keyNote, forKey: "keyNote")
        aCoder.encodeObject(chordProgression, forKey: "chordProgression")
    }
    required init(coder aDecoder: NSCoder!){
        self.styleName = aDecoder.decodeObjectForKey("styleName") as! String
        self.styleBars = aDecoder.decodeObjectForKey("styleBars")as! Int
        self.majorKey = aDecoder.decodeObjectForKey("majorKey") as! Bool
        self.keyNote = aDecoder.decodeObjectForKey("keyNote") as! String
        self.chordProgression = aDecoder.decodeObjectForKey("chordProgression") as! [String]
        super.init()
    }
    
}
