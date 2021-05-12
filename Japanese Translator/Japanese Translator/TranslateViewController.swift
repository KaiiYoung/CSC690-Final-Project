//
//  TestViewController.swift
//  Japanese Translator
//
//  Created by Wilson on 5/9/21.
//

import UIKit

class TranslateViewController: UIViewController {
    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var from: UITextField!
    @IBOutlet weak var to: UITextField!
    @IBOutlet weak var translation: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }*/
    
    @IBAction func traslating(_ sender: Any) {
        //api key obtained from Google Cloud website
        let apiKey = "AIzaSyDlfGM1Ak2LnCE6_PQdCRkomd1tWbaVDuQ"
        
        //Parameters passed into the translate function
        let source = from.text ?? "en"
        let target = to.text ?? "ja"
        let text = text.text ?? "The textfield is empty"
        
        //Initialize the translate class and pass in the api key
        let translator = Translate(with: apiKey)
        
        // pass in the parameters to be used to create URL for translating
        let params = TranslateParams(source: source, target: target, text: text)
        
        //Calls the translation function in the main queue asynchrounously.
        //Use main queue because this is the only thing we're performing a UI update
        translator.translate(params: params) { (result) in
            DispatchQueue.main.async {
                self.translation.text = "\(result)"
            }
        }
    }
}
    
