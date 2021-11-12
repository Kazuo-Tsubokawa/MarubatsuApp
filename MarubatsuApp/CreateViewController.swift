//
//  CreateViewController.swift
//  MarubatsuApp
//
//  Created by 坪川和生 on 2021/11/08.
//

import UIKit

class CreateViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var questionFiled: UITextField!
    @IBOutlet weak var selectButton: UISegmentedControl!
    
    var questions: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionFiled.delegate = self
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil {
            questions = userDefaults.object(forKey: "add") as! [[String : Any]]
        }
    }
    
    @IBAction func topButton(_ sender: Any) {
        //前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let userDefaults = UserDefaults.standard //変数に入れる
        //TextFieldとマルバツの値を取得して問題の配列に格納
        if questionFiled.text != "" {
            var marubatuAnswer: Bool = true
            if selectButton.selectedSegmentIndex == 0 {
                marubatuAnswer = false
            } else {
                marubatuAnswer = true
            }
            questions.append([
                "question": questionFiled.text!,
                "answer": marubatuAnswer
            ])
            userDefaults.set(questions, forKey: "add")
            questionFiled.text = ""
        } else {
            self.showAlert(message: "問題文を入力してください")
        }
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        //問題の配列を空にすれば良い
        let userDefaults = UserDefaults.standard
        questions = []
        userDefaults.set(questions, forKey: "add")
        showAlert(message: "すべて削除しました")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
}
