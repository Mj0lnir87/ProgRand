import UIKit

class DetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var styleBarsLabel: UILabel!
    @IBOutlet weak var styleBarsStepper: UIStepper!
    @IBOutlet weak var majorKeyMinor: UISwitch!
    @IBOutlet weak var keyNote: UIPickerView!
    
    
    var styleName: String!
    var selectedKeyNoteValue: String!
    var majorKey: Bool! = true
    var major = MajorMinor().major
    var minor = MajorMinor().minor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*StyleName*/
        title = styleName
        
        /*StyleBars*/
        if(styleName == "Blues"){
            styleBarsStepper.minimumValue = 12
            
        } else {
            styleBarsStepper.minimumValue = 4
        }
        styleBarsLabel.text = Int(styleBarsStepper.minimumValue).description
        styleBarsStepper.wraps = true
        styleBarsStepper.autorepeat = true
        styleBarsStepper.maximumValue = 20
        
        /*MajorKeyMinor*/
        majorKeyMinor.addTarget(self, action: Selector("changeValuesKeyNotePicker:"), forControlEvents: UIControlEvents.ValueChanged)
        
        /*KeyNote*/
        self.keyNote.dataSource = self
        self.keyNote.delegate = self
        keyNote.selectRow(majorOrMinor().count/2, inComponent: 0, animated: true)
        
    }
    
    /*StyleBars*/
    @IBAction func stepperValueChanged(sender: UIStepper){
        styleBarsLabel.text = Int(sender.value).description
    }
    
    /*MajorKeyMinor*/
    @IBAction func majorKeyMinorClicked (sender: UIButton){
        if majorKeyMinor.on{
            majorKey = false
            majorKeyMinor.setOn(false, animated: true)
            
        } else {
            majorKey = true
            majorKeyMinor.setOn(true, animated: true)
        }
    }
    
    func changeValuesKeyNotePicker(switchState: UISwitch){
        if switchState.on{
            majorKey = false
            keyNote.reloadAllComponents()
        } else {
            majorKey = true
            keyNote.reloadAllComponents()
        }
    }
    
    /*KeyNote*/
    func majorOrMinor() -> [String]{
        if (majorKey == true){
            return major
        } else {
            return minor
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return majorOrMinor().count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedKeyNoteValue = majorOrMinor()[row]
        return selectedKeyNoteValue
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let progressionController = (segue.destinationViewController as! UINavigationController).topViewController as! ProgressionViewController
        let styleBarsStepperValue = Int(styleBarsStepper.value)
        let style = Style(styleName: styleName, styleBars: styleBarsStepperValue, majorKey: majorKey, keyNote: selectedKeyNoteValue, chordProgression: [])
        progressionController.style = style
        
    }
    
    @IBAction func unwindFromGenerartion(segue: UIStoryboardSegue) {
        keyNote.reloadAllComponents()
    }
}