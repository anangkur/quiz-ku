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
        if quizBrain.evaluateAnswer(answer: sender.titleLabel?.text ?? "") {
            sender.tintColor = .green
        } else {
            sender.tintColor = .red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc
    private func updateUI() {
        questionLabel.text = quizBrain.getQuestion()
        rightAnswerLabel.text = quizBrain.getRightAnswer()
        questionProgress.progress = quizBrain.getProgress()
        trueButton.tintColor = .link
        falseButton.tintColor = .link
    }
    
    private func resetUI() {
        quizBrain.reset()
        updateUI()
    }
    
}

