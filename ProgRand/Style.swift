import Foundation

class Style{
    let styleName: String
    let styleBars: Int
    let majorKey: Bool
    let keyNote : String
    
    init(styleName:String, styleBars: Int, majorKey: Bool, keyNote: String){
        self.styleName = styleName
        self.styleBars = styleBars
        self.majorKey = majorKey
        self.keyNote = keyNote        
    }
    
}
