//
//  ViewController.swift
//  Calculadora
//
//  Created by Pedro Cerda on 25-07-21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var calWorking: UILabel!
    
    
    
    @IBOutlet weak var calResult: UILabel!
    
    var working = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }

    func clearAll(){
        
        working = ""
        calWorking.text=""
        calResult.text=""
        
    }
    
    @IBAction func clear(_ sender: Any) {
        clearAll()
    }
    
    
    func addToLog(value: String)
    {
        working = working + value
        calWorking.text = working
        
         
    }
    
    @IBAction func porcentaje(_ sender: Any) {
        addToLog(value: "%")
    }
    
    
    @IBAction func raiz(_ sender: Any) {
        addToLog(value: "√")

    }
    
    
    @IBAction func divisor(_ sender: Any) {
        addToLog(value: "/")

    }
    
    
    @IBAction func multiplicador(_ sender: Any) {
        addToLog(value: "*")

    }
    
    
    @IBAction func suma(_ sender: Any) {
        addToLog(value: "+")

    }
    
    
    @IBAction func resta(_ sender: Any) {
        addToLog(value: "-")

    }
    
    
    @IBAction func punto(_ sender: Any) {
        addToLog(value: ".")

    }
    @IBAction func cero(_ sender: Any) {
        addToLog(value: "0")

    }
    
    
    @IBAction func uno(_ sender: Any) {
        addToLog(value: "1")

    }
    
    
    @IBAction func dos(_ sender: Any) {
        addToLog(value: "2")

    }
    
    
    @IBAction func tres(_ sender: Any) {
        addToLog(value: "3")

    }
    
    @IBAction func cuatro(_ sender: Any) {
        addToLog(value: "4")

    }
    
    
    @IBAction func cinco(_ sender: Any) {
        addToLog(value: "5")

    }
    
    @IBAction func seis(_ sender: Any) {
        addToLog(value: "6")

    }
    
    
    @IBAction func siete(_ sender: Any) {
        addToLog(value: "7")

    }
    
    
    @IBAction func ocho(_ sender: Any) {
        addToLog(value: "8")

    }
    
    @IBAction func nueve(_ sender: Any) {
        addToLog(value: "9")

    }
    
    
    
    @IBAction func equals(_ sender: Any)
    
    {
        
        if(validarInput() && working.contains("%") )
        {
        let checkPorcentaje = working.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkPorcentaje)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatoResultado(result: result)
        calResult.text = resultString
        }
        else if(validarInput() && working.contains("√") )
        {
        let checkRoot = working.replacingOccurrences(of: "√", with: "*1000")
        let expression = NSExpression(format: checkRoot)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatoResultado(result: result)
        calResult.text = resultString
            
        }
        else if(validarInput())
        {
        let checkPorcentaje = working.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkPorcentaje)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatoResultado(result: result)
        calResult.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Input Inválido",
                message: "No se puede realizar dicho cálculo matemático",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            
            self.present(alert, animated: true, completion:nil)
            
        }
        
    }
        
    
    func validarInput() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in working{
            if(characteresEspeciales(char: char)){
                funcCharIndexes.append(count)
            }
            
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0){
                return false
            }
            
            if(index == working.count - 1){
                return false
            }
            
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        
        return true;
    }
    
    
    func characteresEspeciales (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "-"){
            return true
        }
        if(char == "√"){
            return true
        }
        if(char == "."){
            return true
        }
        
        
        return false
    }
    
    func formatoResultado(result:Double) -> String
    {
            
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)

        }
        
    }

}
