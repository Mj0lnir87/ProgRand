import UIKit

class ProgressionViewController: UIViewController{
    
    @IBOutlet weak var styleBarsLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    
    var style: Style!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = style.styleName
        
        styleBarsLabel.text = Int(style.styleBars).description
        
        print("\(style.styleName)" + " \(style.styleBars)" + " \(style.keyNote)" + "Major: \(style.majorKey)")
        
        if style.majorKey == false{
            keyLabel.text = style.keyNote + "m"
        } else {
            keyLabel.text = style.keyNote
        }
    }
    
    @IBAction func done(){
        performSegueWithIdentifier("done", sender: self)
    }
}