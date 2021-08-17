//
//  Question.swift
//  Quizzler
//
//  Created by 谢庭宇 on 2021/8/12.
//  Copyright © 2021 rongcosme. All rights reserved.
//

import Foundation

class Question {
    let answer: Bool
    let questionText: String
    
    init(text:String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
