//
//  ViewController.swift
//  Swift03-tip-calculator
//
//  Created by shinwood on 5/1/16.
//  Copyright © 2016 guox.in. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var formatter = NSNumberFormatter()
    var TipModel = Tip()
    
    var discount: Double = 0.0 {
        didSet {
            sliderEntity.value = Float(discount)
        }
    }
    
    @IBOutlet weak var sliderEntity: UISlider!
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var tipSummary: UILabel!
    @IBOutlet weak var tipInput: UITextField!
    @IBOutlet weak var tipRate: UILabel!
    
    @IBAction func sliderChange(slider: UISlider) {
        let roundedValue:Float = Float(floor(sliderEntity.value * 100) / 100)
        sliderEntity.value = roundedValue
        discount = Double(roundedValue)
        tipRate.text = "小费(" + String(Int(discount * 100)) + "%)"
        TipModel.tipRate = discount
        tipDisplayValue = TipModel.calculateTip(tipInputValue)
        totalDisplayValue = tipDisplayValue + tipInputValue
    }
    
    var tipInputValue: Double = 0.0 {
        didSet {
            tipInput.text = "$" + tipInput.text!
        }
    }
    
    var tipDisplayValue:Double = 0.0  {
        didSet {
            tipValue.text = "$" + String(format: "%.2f", tipDisplayValue)
        }
    }
    
    var totalDisplayValue: Double = 0.0 {
        didSet {
            tipSummary.text = "$" + String(format: "%.2f", totalDisplayValue)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderEntity.maximumValue = 1
        sliderEntity.minimumValue = 0
        sliderEntity.value = Float(discount)
        
        sliderEntity.minimumTrackTintColor=UIColor.redColor()
        sliderEntity.maximumTrackTintColor=UIColor.brownColor()
        
        discount = TipModel.tipRate
        
        tipInput.delegate = self
        tipInput.keyboardType = .DecimalPad
        
        self.addDoneButtonOnKeyboard()
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }

    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0,0,320,50))
        doneToolbar.barStyle = UIBarStyle.Default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title:"Done", style:UIBarButtonItemStyle.Done, target:self, action:#selector(doneButtonAction))
        
        var items = [AnyObject]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items as? [UIBarButtonItem]  //casting
        
        /*OR
        var items: [UIBarButtonItem] = []  //could be var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items
         */
        
        doneToolbar.sizeToFit()
        self.tipInput.inputAccessoryView = doneToolbar

    }
    
    
    //UITextFieldDelegate events
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count == 0{
            return true
        }
        
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if(Double(prospectiveText) != nil && prospectiveText.characters.count <= 7){
            return true
        } else {
            return false;
        }
    }
    
    func doneButtonAction(){
        self.tipInput.resignFirstResponder()
        tipInputValue = formatter.numberFromString(tipInput.text!)!.doubleValue
        tipDisplayValue = TipModel.calculateTip(tipInputValue)
        totalDisplayValue = tipDisplayValue + tipInputValue
    }
    
}


