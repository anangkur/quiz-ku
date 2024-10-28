//
//  ViewController.swift
//  quizku
//
//  Created by Anang Kurniawan on 25/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rightAnswerLabel: UILabel!
    @IBOutlet weak var questionProgress: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    private var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func onButtonClicked(_ sender: UIButton) {
        quizBrain.evaluateAnswer(answer: sender.titleLabel?.text ?? "")
        quizBrain.nextQuestion()
        updateUI()
    }
    
    private func updateUI() {
        if let question = quizBrain.getQuestion() {
            questionLabel.text = question
            rightAnswerLabel.text = quizBrain.getRightAnswer()
            questionProgress.progress = quizBrain.getProgress()
        }
    }
    
    private func resetUI() {
        quizBrain.reset()
        updateUI()
    }
    
}
