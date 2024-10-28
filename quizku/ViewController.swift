//
//  ViewController.swift
//  quizku
//
//  Created by Anang Kurniawan on 25/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionProgress: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    private let questions = [
        "A slug's blood is green.",
        "Approximately one quarter of human bones are in the feet.",
        "The total surface area of two human lungs is approximately 70 square metres.",
        "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
        "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
        "It is illegal to pee in the Ocean in Portugal.",
        "You can lead a cow down stairs but not up stairs.",
        "Google was originally called 'Backrub'.",
        "Buzz Aldrin's mother's maiden name was 'Moon'.",
        "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
        "No piece of square dry paper can be folded in half more than 7 times.",
        "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.",
    ]
    
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(
            question: getQuestion(),
            progress: calculateProgress()
        )
    }

    @IBAction func onButtonClicked(_ sender: UIButton) {
        nextQuestion()
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if (questionIndex < questions.count) {
            updateUI(
                question: getQuestion(),
                progress: calculateProgress()
            )
        }
    }
    
    private func calculateProgress() -> Float {
        return (Float(questionIndex) / Float(questions.count))
    }
    
    private func updateUI(question: String, progress: Float) {
        questionLabel.text = question
        questionProgress.progress = progress
    }
    
    private func resetUI() {
        questionIndex = 0
        updateUI(
            question: getQuestion(),
            progress: calculateProgress()
        )
    }
    
    private func getQuestion() -> String {
        return questions[questionIndex]
    }
    
}

