//
//  QuizViewController.swift
//  Japanese Translator
//
//  Created by Wilson on 5/7/21.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var AnswerField: UITextField!
    @IBOutlet weak var SubmitButton: UIButton!
    
    let deckOfQuestions = QuizQuestions()
    
    //Function to get the current question's prompt from array
    func displayQuestionAtCurrentIndex() {
        let question = deckOfQuestions.currentQuestion
        QuestionLabel.text = question.prompt
    }

    //Action for submit button from Quiz
    @IBAction func submitClicked(_ sender: Any) {
        //Gets the current index from question array
        let question = deckOfQuestions.currentQuestion

        //Gets the user's input
        let userTextInput = AnswerField.text
        //Checks if answer is correct or not
        let isAnswerCorrect = question.answer == userTextInput
        let isAnswerWrong = question.answer != userTextInput
        //Displays alerts based on the user's answer
        if isAnswerCorrect {
            let alertController = UIAlertController(title: "Correct!", message:
                "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            
        }
        if isAnswerWrong {
            let alertController = UIAlertController(title: "Incorrect!", message:
                "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)

        }
        //Gets a new question and displays it
        deckOfQuestions.andvanceIndex()
        displayQuestionAtCurrentIndex()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestionAtCurrentIndex()
    }

}
