//
//  ViewController.swift
//  Sayı Tahmin Oyunu
//
//  Created by Görkem on 22.06.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var textLAbel: UILabel!
    var numberofGuess = 10
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess : Int!
    var prediction = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genarateRandomNumber()
    }
    func genarateRandomNumber(){
        numberToGuess = Int.random(in: lowerBound...upperBound)
    }

    @IBAction func okButton(_ sender: Any) {
        if let guess = numberText.text{
            if let guessInt = Int(guess){
                if numberofGuess > 1{
                    numberofGuess -= 1
                    prediction += 1
                    validateGuess(guessInt)
                    textLAbel.text = "Kalan Tahmin Hakkınız :\(numberofGuess)"
                }else{
                    showMaxNumberAlert()
                    titleLabel.text = "Sayı Tahmin Oyunu!"
                    numberofGuess = 10
                    genarateRandomNumber()
                    textLAbel.text = "Tahmin Hakkınız : 10"
                    prediction = 0
                }
                numberText.text = ""
            }
    }
    func validateGuess(_ guess:Int){
        if guess < lowerBound || guess > upperBound{
            showBoundsAlert()
        }else if guess < numberToGuess{
            titleLabel.text = "Daha Yüksek ⬆️"
        }else if guess > numberToGuess{
            titleLabel.text = "Daha Küçük ⬇️"
        }else{
            showWinAlert()
            titleLabel.text = "Sayı Tahmin Oyunu!"
            numberofGuess = 10
            genarateRandomNumber()
            textLAbel.text = "Tahmin Hakkınız : 10"
            prediction = 0
        }
        numberText.text = ""
        }
        
    }
//    Alerts
    func showBoundsAlert(){
        let alert = UIAlertController(title: "Hey!", message: "Girdiğin Sayı 1 ile 100 arasında olmalı !", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    func showWinAlert(){
        let alert = UIAlertController(title: "Tebrikler!🎉", message: "\(prediction) tahminde bildiniz.", preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Tekrar Oynayın", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    func showMaxNumberAlert(){
        let alert = UIAlertController(title: "Üzgünüm", message: "Tahmin hakkın doldu sayıyı bulamadın!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tekrar Oynayın", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

