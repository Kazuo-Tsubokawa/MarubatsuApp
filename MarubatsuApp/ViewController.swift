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
    let questions: [[String: Any]] = [
        [
            "question": "iPhoneアプリを開発する環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    
    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
    
    
    func showQuestion() {
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String {   //問題文に文字strがあるか
            questionLabel.text = que
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
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
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil) //presentは表示する
    }
    
    
    
    
    
    
}

