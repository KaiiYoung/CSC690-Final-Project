//
//  FlashcardViewController.swift
//  Japanese Translator
//
//  Created by Wilson on 5/5/21.
//

import UIKit

class FlashcardViewController: UIViewController {
    
    //Outlets for all buttons and labels in the VC
    @IBOutlet weak var FlashcardLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var AnswerButton: UIButton!
    
    //Creating a flashcard deck object
    let deckOfFlashcards = FlashcardDeck()

    //Function to display flashcard at the current index
    func displayFlashcardAtCurrentIndex() {
        let question = deckOfFlashcards.currentQuestion
        FlashcardLabel.text = question.prompt
    }
    
    //Action to go to the next flashcard when the user presses it
    @IBAction func NextClicked(_ sender: UIButton) {
        deckOfFlashcards.andvanceIndex()
        displayFlashcardAtCurrentIndex()

    }
    
    //Action to flip the flashcard by displaying the answer instead
    //of the prompt in the text label
    @IBAction func AnswerClicked(_ sender: UIButton) {
        let question = deckOfFlashcards.currentQuestion
        if FlashcardLabel.text == question.prompt {
            FlashcardLabel.text = question.answer
        } else {
            FlashcardLabel.text = question.prompt
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayFlashcardAtCurrentIndex()
        
    }

}
