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
    
    var titleString = ""
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0).cgColor
        
        textFieldMin.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
        textFieldMax.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
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
            titleString = "Min value required"
            showAlert(titleString)
            
        }
         else if(textFieldMin.text != "" && textFieldMax.text == ""){
            titleString = "Max value required"
            showAlert(titleString)
            }
            
        else{
            titleString = "Min and Max values required"
            showAlert(titleString)
          }
    }
    
    //Alert
    func showAlert(_ titleStr: String){
        let alert = UIAlertController(title: titleStr, message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Gradient background
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [color1, color2]
        
        self.backgroundView.layer.addSublayer(gradientLayer)
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

