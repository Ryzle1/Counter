//
//  ViewController.swift
//  Counter
//
//  Created by Robert on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var counterlabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!


    
    var counterValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterlabel.text = "\(counterValue)"
        historyTextView.text = "История изменений:\n"
        historyTextView.isUserInteractionEnabled = true
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
        counterlabel.font = UIFont.systemFont(ofSize: 40)
        
        
    }
    
    @IBAction func incrementCounter(_ sender: UIButton) {
        updateCounter(by: 1)
    }
    @IBAction func decrementCounter(_ sender: UIButton) {
        updateCounter(by: -1)
    }

    
    @IBAction func resetCounter(_ sender: UIButton) {
        let currentDate = getCurrentDate()
        historyTextView.text += "\(currentDate): значение сброшено\n"
        counterValue = 0
        counterlabel.text = "\(counterValue)"
    }
    
    func updateCounter(by value: Int) {
            let currentDate = getCurrentDate()
            if counterValue + value >= 0 {
                counterValue += value
                counterlabel.text = "\(counterValue)"
                let operation = value > 0 ? "+" : "-"
                historyTextView.text += "\(currentDate): значение изменено на \(operation)\(abs(value))\n"
            } else {
                historyTextView.text += "\(currentDate): попытка уменьшить значение счетчика ниже 0\n"
            }
        }
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}
    
