//
//  QuizManager.swift
//  SwiftQuiz
//
//  Created by Jameel Shehadeh on 11/25/21.
//

import Foundation


struct QuizManager {
    
    var questionCount = 0
    
    let questionBank1 : [Question] = [Question(question: "Main queue is considered a serial queue?", answer: Answer(trueOrFalseAnswer: true, multipleChoiceAnswer: nil), questionType: .TrueOrFalse),
                                      
                                      Question(question: "Which statement is true about optionals ?", answer: Answer(trueOrFalseAnswer: nil, multipleChoiceAnswer: ["They cant hold a value of nil" : false , "Optional values must be initialized" : false , "Optional is an Enum with 2 cases and one of the cases has an associated value" : true , "it is a good idea to force unwrap an optional" : false ]), questionType: .MultipleChoice) ,
                                      
                                      Question(question: "What do you use to control how values are captured in a closure?", answer: Answer(trueOrFalseAnswer: nil , multipleChoiceAnswer: ["Arrays" : false , "parameters" : false , "Capture Lists" : true , "Objects" : false]), questionType: .MultipleChoice) ,
                                      
                                      Question(question: "Which of the following statements are true for UIViewController?", answer: Answer(trueOrFalseAnswer: nil, multipleChoiceAnswer: ["They can't be deallocated from memory" : false , "They can't be inherited by another class" : false , "A UIViewController is an object which manages the view hierarchy of the UIKit application" : true , "UIViewController is a sub class of UITableView" : false]), questionType: .MultipleChoice)
    ]
    
    
    
  //Which of the following statements are true for UIViewController?
    
//    viewWillAppear will be called before a view appears on the screen.
//    viewDidRender will be called after a view renders on the screen.
//    viewWillDisappear is called after animations are configured.
//    When using storyboards, the controller is initialized with the init(coder:)/initWithCoder method.
//    View controllers manage a hierarchy of views.
    
    
    
    mutating func nextQuestion() {
        
        if questionCount < questionBank1.count-1 {
            questionCount += 1
        }
        
    }
    
    mutating func previousQuestion() {
        
        if questionCount != 0 {
            questionCount -= 1
        }
        
    }
    
    
}
