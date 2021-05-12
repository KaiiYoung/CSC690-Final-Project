//
//  DeckOfFlashcards.swift
//  Japanese Translator
//
//  Created by Wilson on 5/4/21.
//

import Foundation

//Protocol to create flashcards
protocol Flashcard {
    var prompt: String { get }
    var answer: String { get }
}

//Struct to create flashcards
struct FlashCardQuestion: Flashcard {
    let prompt: String
    let answer: String
}

class FlashcardDeck {
    //Used to increment through the array of flashcards
    private var currentIndex: Int = 0
    
    //Array of flashcards
    private var flashCards: [Flashcard] = [
        FlashCardQuestion(prompt: "こんにちは", answer: "Hello"),
        FlashCardQuestion(prompt: "さようなら", answer: "Goodbye"),
        FlashCardQuestion(prompt: "はい", answer: "Yes"),
        FlashCardQuestion(prompt: "お願いします", answer: "Please"),
        FlashCardQuestion(prompt: "ありがとうございました", answer: "Thank You"),
        FlashCardQuestion(prompt: "ごめんなさい", answer: "Sorry"),
        FlashCardQuestion(prompt: "すみません", answer: "Excuse me"),
        FlashCardQuestion(prompt: "おはようございます", answer: "Good morning"),
        FlashCardQuestion(prompt: "おやすみなさい", answer: "Good night")
    ]
    
    //Returns the flashcard at the current index
    var currentQuestion: Flashcard {
        return flashCards[currentIndex]
    }
    
    //Function to go to the next flashcard
    func andvanceIndex() {
        if currentIndex + 1 < flashCards.count {
            currentIndex += 1
        } else {
            flashCards.shuffle()
            currentIndex = 0
        }
    }
    
    
}
