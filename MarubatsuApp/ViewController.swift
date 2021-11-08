//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 坪川和生 on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    var questions: [[String: Any]] = []
    
    //    let questions: [[String: Any]] = [
    //        [
    //            "question": "",
    //            "answer": false
    //        ],
    //        [
    //            "question": "",
    //            "answer": true
    //        ],
    //        [
    //            "question": "",
    //            "answer": true
    //        ]
    //    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        // 何かが保存されているときだけ処理をする(nilではない)
        if userDefaults.object(forKey: "add") != nil {
            questions = userDefaults.object(forKey: "add") as! [[String : Any]]
        }
        showQuestion()
    }
    
    
    @IBAction func createButton(_ sender: Any) {
    }
    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
    func showQuestion() {
        if questions.isEmpty == true {
            questionLabel.text = "問題がありません。問題文を作りましょう"
        } else {
            var question = questions[currentQuestionNum]
            if let que = question["question"] as? String {   //問題文に文字strがあるか
                questionLabel.text = que
            }
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        if questions.isEmpty != true {
            let question = questions[currentQuestionNum]
            
            if let ans = question["answer"] as? Bool {
                if yourAnswer == ans {
                    currentQuestionNum += 1
                    showAlert(message: "正解!")
                } else {
                    showAlert(message: "残念...不正解!")
                }
            } else {
                print("答えが入っていません")
                return
            }
            //3問以上になったら0番目に戻すよ
            if currentQuestionNum >= questions.count {
                currentQuestionNum = 0
            }
            showQuestion() //正解->次の問題 不正解->再表示
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil) //presentは表示する
    }
    
    
    
    
    
    
}

