//
//  ViewController.swift
//  Japanese Translator
//
//  Created by Wilson on 5/4/21.
//

import UIKit

class ViewController: UIViewController {

    //Action to present Flashcard VC
    @IBAction func clickFlashcards() {
       guard let flashvc = storyboard?.instantiateViewController(identifier: "flashcard_vc") as? FlashcardViewController else {
        return
       }
        present(flashvc, animated: true)
    }
    
    //Action to present Quiz VC
    @IBAction func clickQuiz() {
        guard let quizvc = storyboard?.instantiateViewController(identifier: "quiz_vc") as? QuizViewController else {
         return
        }
         present(quizvc, animated: true)
    }
    
    //Action to present Translation VC
    @IBAction func clickTranslate() {
        guard let translatevc = storyboard?.instantiateViewController(identifier: "test_vc") as? TranslateViewController else {
         return
        }
         present(translatevc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

