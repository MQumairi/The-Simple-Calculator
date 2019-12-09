//
//  ViewController.swift
//  ACalculator
//
//  Created by Mohammed Alqumairi on 12/8/19.
//  Copyright © 2019 Mohammed Alqumairi. All rights reserved.
//

/**LOGIC:
 1. Initialize an array (size 10)
 2. As numbers are pressed, they are added to array. Then, the contents of array are displayed as single number on screen.
 3. Save array number to variable (screenNumber), updating with every button press.
 4. When operation is pressed, create a new variable (operationNumber), initialized to screenNumber.
 5. When equal is pressed without active operation, do nothing.
 6. When equal is pressed with active operation, perform operation between operationNumber and screenNumber.
 7. Display the answer to screen.
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calcScreen: UILabel!
    
    var screenLabel = ScreenLabel()
    
    var screenNumber = 0.0;
    
    var firstOperand = 0.0;
    var secondOperand = 0.0;
    
    var operationPressed = false;
    var editingSecondOperand = false;
    var equalsPressed = false;
    
    var operationPlusPressed = false;
    var operationMinusPressed = false;
    var operationMultiPressed = false;
    var operationDivPressed = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func printArray() {print(screenLabel.getArray())}
    
    //Handles Displaying on screen
    func displayOnScreen (numb : Double) {
        
        print("-----------")
        print("BEFORE")
        print("OperationPressed = " + String(operationPressed))
        print("Screen Num = " + String(screenNumber))
        print("Operand1 Num = " + String(firstOperand))
        print("Operand2 Num = " + String(secondOperand))
        
        
        if(operationPressed) {
            screenLabel.clearLabel()
            calcScreen.text = String(0)
            firstOperand = screenNumber
            operationPressed = false
        }
        
        if(equalsPressed) {
            screenLabel.clearLabel()
            calcScreen.text = String(0)
            equalsPressed = false
        }

        //Append the number to the array
        screenLabel.addToScreenArray(numb: numb)

        
        calcScreen.text = screenLabel.getScreenString()
        
        print("The Number is " + String(screenLabel.screenArrayStringToNumb()))

        screenNumber = screenLabel.screenArrayStringToNumb()
        
        
        if(editingSecondOperand) {
            secondOperand = screenNumber
        }
        
        print("-----------")
        print("AFTER")
        print("OperationPressed = " + String(operationPressed))
        print("Screen Num = " + String(screenNumber))
        print("Operand1 Num = " + String(firstOperand))
        print("Operand2 Num = " + String(secondOperand))
        print(screenLabel.getCharArray())

    }
    
    
    
    //Hanldes Operation Variable
    func handleOperationVar () {
        
    }
    
    
    
    
    //Operation Functions
    
    func addition (numb1 : Double, numb2 : Double) -> Double {
        let total = numb1 + numb2
        return total
    }
    
    func subtraction (numb1 : Double, numb2 : Double) -> Double {
        let total = numb1 - numb2
        return total
    }
    
    func multiplication (numb1 : Double, numb2 : Double) -> Double {
        let total = numb1 * numb2
        return total
    }
    
    func division (numb1 : Double, numb2 : Double) -> Double {
        let total = numb1 / numb2
        return total
    }
    
    func changeSign (numb1 : Double) -> Double {
        return numb1 * -1
    }
    
    func div100 (numb1 : Double) -> Double {
        return numb1 / 100
    }
    
    
    //NUMBER BUTTONS
    
    @IBAction func Button0(_ sender: Any) {
        if(screenLabel.getSize() != 0) {
            displayOnScreen(numb: 0)
        }
    }
    
    @IBAction func Button1(_ sender: Any) {
        displayOnScreen(numb: 1)
    }
    
    @IBAction func Button2(_ sender: Any) {
        displayOnScreen(numb: 2)
    }
    
    @IBAction func Button3(_ sender: Any) {
        displayOnScreen(numb: 3)
    }
    
    @IBAction func Button4(_ sender: Any) {
        displayOnScreen(numb: 4)
    }
    
    @IBAction func Button5(_ sender: Any) {
        displayOnScreen(numb: 5)
    }
    
    @IBAction func Button6(_ sender: Any) {
        displayOnScreen(numb: 6)
    }
    
    @IBAction func Button7(_ sender: Any) {
        displayOnScreen(numb: 7)
    }
    
    @IBAction func Button8(_ sender: Any) {
        displayOnScreen(numb: 8)
    }
    
    
    @IBAction func Button9(_ sender: Any) {
        displayOnScreen(numb: 9)
    }
    
    
    //OPERATION BUTTONS
    
    
    @IBAction func ButtonEqual(_ sender: Any) {
        
        
        if(operationPlusPressed) {
            screenLabel.clearLabel()
            displayOnScreen(numb: addition(numb1: firstOperand, numb2: secondOperand))
        }
        
        if(operationMinusPressed) {
            screenLabel.clearLabel()
            displayOnScreen(numb: subtraction(numb1: firstOperand, numb2: secondOperand))
        }
        
        if(operationMultiPressed) {
            screenLabel.clearLabel()
            displayOnScreen(numb: multiplication(numb1: firstOperand, numb2: secondOperand))
        }
        
        if(operationDivPressed) {
            screenLabel.clearLabel()
            displayOnScreen(numb: division(numb1: firstOperand, numb2: secondOperand))
        }
        
        //        operationPressed = false
        
        editingSecondOperand = false
        operationPlusPressed = false;
        operationMinusPressed = false;
        operationMultiPressed = false;
        operationDivPressed = false;
        
        equalsPressed = true
        
        print("-----------")
        print("OperationPressed = " + String(operationPressed))
        print("EqualsPressed = " + String(equalsPressed))
        print("Screen Num = " + String(screenNumber))
        print("Operand1 Num = " + String(firstOperand))
        print("Operand2 Num = " + String(secondOperand))
        
        
    }
    
    
    @IBAction func ButtonPlus(_ sender: Any) {
        operationPressed = true
        operationPlusPressed = true
        editingSecondOperand = true
        
        print("-----------")
        print("Plus pressed")
        print("Screen Num = " + String(screenNumber))
        print("Operand1 Num = " + String(firstOperand))
        print("Operand2 Num = " + String(secondOperand))
    }
    
    @IBAction func ButtonMinus(_ sender: Any) {
        operationPressed = true
        operationMinusPressed = true
        editingSecondOperand = true
        
        print("-----------")
        print("Minus pressed")
        print("Screen Num = " + String(screenNumber))
        print("Operand1 Num = " + String(firstOperand))
        print("Operand2 Num = " + String(secondOperand))
    }
    
    @IBAction func ButtonMultiply(_ sender: Any) {
        operationPressed = true
        operationMultiPressed = true
        editingSecondOperand = true
        
        print("-----------")
        print("Multi pressed")
        print("Screen Num = " + String(screenNumber))
        print("Operand1 Num = " + String(firstOperand))
        print("Operand2 Num = " + String(secondOperand))
    }
    
    @IBAction func ButtonDivide(_ sender: Any) {
        operationPressed = true
        operationDivPressed = true
        editingSecondOperand = true
        
        
        print("-----------")
        print("Div pressed")
        print("Screen Num = " + String(screenNumber))
        print("Operand1 Num = " + String(firstOperand))
        print("Operand2 Num = " + String(secondOperand))
    }
    
    
    //OTHER BUTTONS
    
    @IBAction func ButtonAC(_ sender: Any) {
        screenLabel.clearLabel()
        operationPressed = false
        operationPlusPressed = false
        
        screenNumber = 0.0
        firstOperand = 0.0
        secondOperand = 0.0
        
        print("CLEAR")
        calcScreen.text = String(0)
    }
    
    
    @IBAction func ButtonSign(_ sender: Any) {
        screenLabel.clearLabel()
        displayOnScreen(numb: changeSign(numb1: screenNumber))
    }
    
    @IBAction func ButtonPercent(_ sender: Any) {
        screenLabel.clearLabel()
        displayOnScreen(numb: div100(numb1: screenNumber))
    }
    
    
    @IBAction func ButtonDecimal(_ sender: Any) {
        screenLabel.addToCharArray(str: ".")
        print(screenLabel.getCharArray())
    }
    
    
    
    
    func resetScreen() {
        screenLabel.clearLabel()
        operationPressed = false
        operationPlusPressed = false
        
        screenNumber = 0.0
        firstOperand = 0.0
        secondOperand = 0.0
    }
    
}

