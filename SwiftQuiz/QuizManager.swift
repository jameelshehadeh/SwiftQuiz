//
//  QuizManager.swift
//  SwiftQuiz
//
//  Created by Jameel Shehadeh on 11/25/21.
//

import Foundation


struct QuizManager {
     
    var questionCount = 0
    
    let questionBank1 : [Question] = [Question(question: "is main thread a serial queue ?", answer: Answer(trueOrFalseAnswer: true, multipleChoiceAnswer: nil), questionType: .TrueOrFalse) , Question(question: "Which statement is true about optionals ?", answer: Answer(trueOrFalseAnswer: nil, multipleChoiceAnswer: ["They cant be nil" : false , "They must be unwrapped before we use them" : false , "Optionals are example on enums" : true , "its good to force unwrap an optional" : false  ]), questionType: .MultipleChoice)]
  

    mutating func nextQuestion() {
        
        if questionCount < questionBank1.count-1 {
            questionCount += 1
        }
        
    }
    
    
    
    
    
}
