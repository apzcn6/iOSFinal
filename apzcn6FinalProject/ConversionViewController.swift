//
//  ConversionViewController.swift
//  ConversionCalculator
//
//  Created by Andrew Ziber on 12/6/19.
//  Copyright © 2019 Andrew Ziber. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet weak var outputDisplay: UITextField!
      @IBOutlet weak var inputDisplay: UITextField!

    
    let con = ConversionType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        inputDisplay.text = con.convertArray[0].inputCon
            outputDisplay.text = con.convertArray[0].outputCon
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func changeConversion(_ sender: Any) {
        
        let sheetconversion = UIAlertController(title: "Conversions", message: "Please select a conversion", preferredStyle: UIAlertController.Style.actionSheet)
        
        let ftc = UIAlertAction(title: con.convertArray[0].labelCon, style: .default) {action in
            self.con.wow = 0
            self.convertButton()
        }
        
        let ctf = UIAlertAction(title: con.convertArray[1].labelCon, style: .default) {action in
            self.con.wow = 1
            self.convertButton()
        }
        let mtk = UIAlertAction(title: con.convertArray[2].labelCon, style: .default) {action in
            self.con.wow = 2
            self.convertButton()
        }
        let ktm = UIAlertAction(title: con.convertArray[3].labelCon, style: .default) {action in
            self.con.wow = 3
            self.convertButton()
        }
    
        sheetconversion.addAction(ftc)
        sheetconversion.addAction(ctf)
        sheetconversion.addAction(mtk)
        sheetconversion.addAction(ktm)
        
        present(sheetconversion, animated: true, completion: nil)

        
    }
    
    func convertButton() {
        let input = lfi()
        let convertInput = Double(input)
        
        inputDisplay.text = input + con.convertArray[con.wow].inputCon
        if input != "" {
            if input == "." && input == "-."{
                outputDisplay.text = input + con.convertArray[con.wow].outputCon
            } else {
                outputDisplay.text = String(con.convert(convertInput!)) + con.convertArray[con.wow].outputCon
            }
        } else {
            outputDisplay.text = con.convertArray[con.wow].outputCon
        }
        
        
    }
    
  
    
    @IBAction func clearButton(_ sender: UIButton) {
        inputDisplay.text = con.convertArray[con.wow].inputCon
        outputDisplay.text = con.convertArray[con.wow].outputCon
        con.decimal = false
    }
    
    @IBAction func signChange(_ sender: UIButton) {
        
        var input = inputDisplay.text
        if input!.hasPrefix(" "){
            return
        }else {
            if input!.hasPrefix("-") {
                input!.remove(at: input!.startIndex)
                inputDisplay.text = input!
                input = self.lfi()
                
                if input != "."{
                    let conInput = Double(input!)
                    outputDisplay.text = String(con.convert(conInput!)) + con.convertArray[con.wow].outputCon
                } else {
                    outputDisplay.text = input! + con.convertArray[con.wow].outputCon
                }}
            else{
                    input!.insert("-", at: input!.startIndex)
                inputDisplay.text = input!
                input = self.lfi()
                if input != "-" {
                    let conInput = Double(input!)
                    outputDisplay.text = String(con.convert(conInput!)) + con.convertArray[con.wow].outputCon
                } else {
                    outputDisplay.text = input! + con.convertArray[con.wow].outputCon
                }
                }
                
            }
            
        }
    
    @IBAction func clear(_ sender: UIButton) {
        outputDisplay.text = con.convertArray[con.wow].outputCon
        inputDisplay.text = con.convertArray[con.wow].inputCon
        con.decimal = false
        
    }
    
       @IBAction func numbers(_ sender: UIButton) {
        numUpdate(sender.titleLabel!.text!)
    }
        
    func numUpdate(_ inputNumber: String){
         if inputNumber == "." && con.decimal == true {
                   return
               } else if inputNumber == "." && con.decimal == false {
                   con.decimal = true
               }
               
               var inputString = lfi()
               inputString += inputNumber
               
               let conversionInput = Double(inputString)
               
               inputString += con.convertArray[con.wow].inputCon
               
               if inputString.hasPrefix(".") {
                   inputDisplay.text = inputString
                   outputDisplay.text = inputNumber + con.convertArray[con.wow].outputCon
               } else {
                   inputDisplay.text = inputString
                   outputDisplay.text = String(con.convert(conversionInput!)) + con.convertArray[con.wow].outputCon
               }
           }
        func lfi() -> String {
           var inputString = inputDisplay.text
                               let inputLabel = (inputString!.index(inputString!.endIndex, offsetBy: -3))..<inputString!.endIndex
                               inputString!.removeSubrange(inputLabel)
                               return inputString!
                    }
    }

