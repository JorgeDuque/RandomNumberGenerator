//
//  ViewController.swift
//  Random Number Generator
//
//  Created by Jorge Duque on 12/27/16.
//  Copyright © 2016 Jorgeduque. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldMin: UITextField!
    @IBOutlet weak var textFieldMax: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonGenerateRandom(_ sender: Any) {
        
         if (textFieldMin.text != "" && textFieldMax.text != ""){
            
            let min = UInt32(textFieldMin.text!)!
            let max = UInt32(textFieldMax.text!)!

            let randomNumber = Int(arc4random_uniform(UInt32(1 + max - min)) + min)
            labelResult.text = "\(randomNumber)"
            
         }
        
        else if (textFieldMin.text == "" && textFieldMax.text != ""){
            labelResult.text = "Please enter a minimum value"
        }
         else if(textFieldMin.text != "" && textFieldMax.text == ""){
            labelResult.text = "Please enter a maximum value"
            }
            
        else{
            labelResult.text = "Please enter minimum and maximum values"
          }
    }
    
    //Hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
 
}

