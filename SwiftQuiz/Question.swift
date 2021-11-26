//
//  Question.swift
//  SwiftQuiz
//
//  Created by Jameel Shehadeh on 11/25/21.
//

import Foundation
import UIKit


struct Question {
    
    let question : String
    
    let answer : Answer
    
    let questionType : QuestionType
    
}


struct Answer {
    
    let trueOrFalseAnswer : Bool?
    let multipleChoiceAnswer : [String : Bool]?
    
}


enum QuestionType  {
    
    case TrueOrFalse
    case MultipleChoice
    
}
