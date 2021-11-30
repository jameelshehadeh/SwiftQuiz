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
    
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var forthOptionButton: UIButton!
    
    @IBOutlet weak var lowerAnswersStackView: UIStackView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        secondOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        thirdOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        forthOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true

        
        updateUI()

    }
    
    
    func updateUI(){
        
        // we need to update the ui based on the questionCount value
        
        print("question count = \(quiz.questionCount) , bank count \(quiz.questionBank1.count)")
        progressView.progress =  Float(quiz.questionCount + 1) / Float(quiz.questionBank1.count)
        switch quiz.questionBank1[quiz.questionCount].questionType {

        case .TrueOrFalse :
            
            
            questionLabel.text = quiz.questionBank1[quiz.questionCount].question
            
            DispatchQueue.main.async {
                self.lowerAnswersStackView.isHidden = true
            }
            firstOptionButton.setTitle("True", for: .normal)
            secondOptionButton.setTitle("False", for: .normal)
                
            
        
        case .MultipleChoice:
           
            guard let answers = quiz.questionBank1[quiz.questionCount].answer.multipleChoiceAnswer else {
                return
            }
            
            DispatchQueue.main.async {
                self.questionLabel.text = self.quiz.questionBank1[self.quiz.questionCount].question
                self.lowerAnswersStackView.isHidden = false
            }
            
            var answerIndex = 0
            
            for answer in answers {
                
                if answerIndex == 0 {
                    DispatchQueue.main.async {

                        self.firstOptionButton.setTitle("\(answer.key)", for: .normal)
                    }
                    
                    
                }
                
                else if answerIndex == 1 {
                    
                    DispatchQueue.main.async {

                        self.secondOptionButton.setTitle("\(answer.key)", for: .normal)
                    }
                    
                }
                
                else if answerIndex == 2 {
                    DispatchQueue.main.async {

                        self.thirdOptionButton.setTitle("\(answer.key)", for: .normal)
                    }
                    
                }
                
                else if answerIndex == 3 {
                    
                    DispatchQueue.main.async {

                        self.forthOptionButton.setTitle("\(answer.key)", for: .normal)
                    }
                    
                }
                
                answerIndex += 1
                
            }
            
            
        }

    }
    
    @IBAction func firstOptionPressed(_ sender: UIButton) {
        
        //True button/first option pressed
        
        checkAnswer(for: sender.tag)

        
    }
    
    
    @IBAction func secondOptionPressed(_ sender: UIButton) {
        
        checkAnswer(for: sender.tag)
                
    }
    
    
    @IBAction func thirdOptionPressed(_ sender: UIButton) {
        
        checkAnswer(for: sender.tag)
    }
    
    @IBAction func forthOptionPressed(_ sender: UIButton) {
        
        checkAnswer(for: sender.tag)
    }
    
    
    
    func checkAnswer(for senderTag : Int ) {
        
        switch senderTag {
            
        case 1 :
        // True or firstOption
            switch quiz.questionBank1[quiz.questionCount].questionType {
            
            case .TrueOrFalse :
                if quiz.questionBank1[quiz.questionCount].answer.trueOrFalseAnswer == true {
                    // True answer
                    firstOptionButton.backgroundColor = .systemGreen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.firstOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                    }
                    quiz.nextQuestion()
                    updateUI()
                    
                }
                
                else {
                    //False answer
                    if quiz.questionBank1[quiz.questionCount].answer.trueOrFalseAnswer == false {
                        firstOptionButton.backgroundColor = .red
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.firstOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                        }
                        quiz.nextQuestion()
                        updateUI()
                    }
                }
                
            case .MultipleChoice:
                guard let choosenAnswer = firstOptionButton.titleLabel?.text else {
                    return
                }
                
                if quiz.questionBank1[quiz.questionCount].answer.multipleChoiceAnswer?["\(choosenAnswer)"] == true {
                    // true
                    firstOptionButton.backgroundColor = .systemGreen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.firstOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                    }
                    quiz.nextQuestion()
                    updateUI()
                    
                }
                else {
                    //false
                    firstOptionButton.backgroundColor = .red
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.firstOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                    }
                    quiz.nextQuestion()
                    updateUI()
                }
            }
            
        case 2 :
            
        // False or secondOption
            switch quiz.questionBank1[quiz.questionCount].questionType {
                
            case .TrueOrFalse :
                if quiz.questionBank1[quiz.questionCount].answer.trueOrFalseAnswer == false {
                    // True answer
                    secondOptionButton.backgroundColor = .systemGreen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.secondOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                    }
                    quiz.nextQuestion()
                    updateUI()
                    
                }
                
                else {
                    //False answer
                    if quiz.questionBank1[quiz.questionCount].answer.trueOrFalseAnswer == true {
                        secondOptionButton.backgroundColor = .red
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.secondOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                        }
                        quiz.nextQuestion()
                        updateUI()
                    }
                }
                
            case .MultipleChoice:
                
                guard let choosenAnswer = secondOptionButton.titleLabel?.text else {
                    return
                }
                
                if quiz.questionBank1[quiz.questionCount].answer.multipleChoiceAnswer?["\(choosenAnswer)"] == true {
                    // true
                    secondOptionButton.backgroundColor = .systemGreen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.secondOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                    }
                    quiz.nextQuestion()
                    updateUI()
                    
                }
                else {
                    //false
                    secondOptionButton.backgroundColor = .red
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.secondOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                    }
                    quiz.nextQuestion()
                    updateUI()
                    
                }
                
            }

        case 3 :
//         thirdOption
            guard let choosenAnswer = thirdOptionButton.titleLabel?.text else {
                return
            }
            
            if quiz.questionBank1[quiz.questionCount].answer.multipleChoiceAnswer?["\(choosenAnswer)"] == true {
                // true
                thirdOptionButton.backgroundColor = .systemGreen
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.thirdOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                }
                quiz.nextQuestion()
                updateUI()
                
            }
            else {
                //false
                thirdOptionButton.backgroundColor = .red
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.thirdOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                }
                quiz.nextQuestion()
                updateUI()
                
            }

        case 4 :
        // forthOption
            
            guard let choosenAnswer = forthOptionButton.titleLabel?.text else {
                return
            }
            
            if quiz.questionBank1[quiz.questionCount].answer.multipleChoiceAnswer?["\(choosenAnswer)"] == true {
                // true
                forthOptionButton.backgroundColor = .systemGreen
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.forthOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                }
                quiz.nextQuestion()
                updateUI()
                
            }
            else {
                //false
                forthOptionButton.backgroundColor = .red
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.forthOptionButton.backgroundColor = UIColor(named: "SwiftOrange")
                }
                quiz.nextQuestion()
                updateUI()
                
            }
            
        default:
            break
        }
 
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        quiz.nextQuestion()
        updateUI()
    }
    
    
    @IBAction func previousPressed(_ sender: UIButton) {
        
        quiz.previousQuestion()
        updateUI()
        
    }
    
    

}
