//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Jameel Shehadeh on 11/25/21.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    var quiz = QuizManager()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var forthOptionButton: UIButton!
    
    @IBOutlet weak var lowerAnswersStackView: UIStackView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    
    
    func updateUI(){

        switch quiz.questionBank1[quiz.questionCount].questionType {
            
        case .TrueOrFalse :
            questionLabel.text = quiz.questionBank1[quiz.questionCount].question
            lowerAnswersStackView.isHidden = true
            
        case .MultipleChoice:
            questionLabel.text = quiz.questionBank1[quiz.questionCount].question
            lowerAnswersStackView.isHidden = false
            
        }

    }
    
    @IBAction func firstOptionPressed(_ sender: UIButton) {
        
        switch quiz.questionBank1[quiz.questionCount].questionType {
            
        case .TrueOrFalse :
            
            if quiz.questionBank1[quiz.questionCount].answer.trueOrFalseAnswer == true {
                // True answer
                firstOptionButton.backgroundColor = .systemGreen
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.firstOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                }
            }
            
            else {
                //False answer
            }
            
        case .MultipleChoice:
            break
            
        }
        
    }
    
    
    @IBAction func secondOptionPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func thirdOptionPressed(_ sender: UIButton) {
    }
    
    @IBAction func forthOptionPressed(_ sender: UIButton) {
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        quiz.nextQuestion()
        updateUI()
    }
    
    
    @IBAction func previousPressed(_ sender: UIButton) {
        
        quiz.questionCount -= 1
        updateUI()
        
    }
    
    

}
