//
//  ViewController.swift
//  FitHealth-calculator
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ageTextField:
    UITextField!
    @IBOutlet weak var heightTextField:
    UITextField!
    @IBOutlet weak var weightTextField:
    UITextField!
    @IBOutlet weak var sexSegmentedControl:
    UISegmentedControl!
    @IBOutlet weak var activitySegmentedControl:
    UISegmentedControl!
    @IBOutlet weak var Result:
    UILabel!
    @IBAction func CalculateTapped(_ sender: AnyObject)
    {
        guard let ageText = ageTextField.text, let age = Double(ageText),
              let weightText = weightTextField.text, let weight = Double(weightText),
              let heightText = heightTextField.text, let height = Double(heightText)
        else
        {
            return
        }
        
        var bmr: Double = 0
        if sexSegmentedControl.selectedSegmentIndex == 0 { //Мужчины
            bmr = 88.36 + (13.4 * weight) + (4.8 * height) - (5.7 * age)
        } else {//Женщина
            bmr = 447.6 + (9.2 * weight) + (3.1 * height) - (4.3 * age)
        }
        
        var activityMultiplier: Double = 0
        switch activitySegmentedControl.selectedSegmentIndex {
        case 0:
            activityMultiplier = 1.2
        case 1:
            activityMultiplier = 1.375
        case 2:
            activityMultiplier = 1.55
        case 3:
            activityMultiplier = 1.725
        case 4:
            activityMultiplier = 1.9
        default:
            break
        }
        
        let bmrWithActivity = bmr * activityMultiplier
        let bmi = weight / pow (height/100, 2)
        Result.text = "Ваш BMR: \(bmrWithActivity)\nВаш ИМТ: \(bmi)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
