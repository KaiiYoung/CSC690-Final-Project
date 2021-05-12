//
//  QuizQuestions.swift
//  Japanese Translator
//
//  Created by Wilson on 5/7/21.
//

import Foundation

//Protocol for questions
protocol Question {
    var prompt: String { get }
    var answer: String { get }
}

//Struct for questions
struct QuizQuestion: Question {
    let prompt: String
    let answer: String
}

class QuizQuestions {

    //Used to increment through the quiz question array
    private var currentIndex: Int = 0

    //Array of quiz questions
    var questions: [Question] = [
        QuizQuestion(prompt: "こんにちは", answer: "Hello"),
        QuizQuestion(prompt: "さようなら", answer: "Goodbye"),
        QuizQuestion(prompt: "はい", answer: "Yes"),
        QuizQuestion(prompt: "お願いします", answer: "Please"),
        QuizQuestion(prompt: "ありがとうございました", answer: "Thank You"),
        QuizQuestion(prompt: "ごめんなさい", answer: "Sorry"),
        QuizQuestion(prompt: "すみません", answer: "Excuse me"),
        QuizQuestion(prompt: "おはようございます", answer: "Good morning"),
        QuizQuestion(prompt: "おやすみなさい", answer: "Good night")
    ]

    //Returns the current question at the index
    var currentQuestion: Question {
        return questions[currentIndex]
    }

    //Goes to the next question and shuffles the deck if we hit the last question
    func andvanceIndex() {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
        } else {
            questions.shuffle()
            currentIndex = 0
        }
    }
}
