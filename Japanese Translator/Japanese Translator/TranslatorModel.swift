//
//  TranslatorModel.swift
//  Japanese Translator
//
//  Created by Wilson on 5/9/21.
//

import Foundation

//Struct used to create parameters for translating
public struct TranslateParams {
    
    var source: String
    var target: String
    var text:   String
}

open class Translate {

    public var apiKey = "AIzaSyDlfGM1Ak2LnCE6_PQdCRkomd1tWbaVDuQ"
    
    public init(with apiKey: String) {
        self.apiKey = apiKey
    }
    
    //Main translation function
    //Callback returns the translated string from website
    open func translate(params: TranslateParams, callback: @escaping (_ translatedText: String) -> ()) {

        //Creates the URL to be sent
        guard
            let urlEncodedText = params.text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            //Requires the api key, original language, and target language
            let url = URL(string: "https://www.googleapis.com/language/translate/v2?key=\(self.apiKey)&q=\(urlEncodedText)&source=\(params.source)&target=\(params.target)") else {
                return
        }
        
        //Creates the http request with URL
        let httprequest = URLSession.shared.dataTask(with: url,               completionHandler: { (data, response, error) in
            
            //Incase there was an error sending the HTTP request
            guard error == nil, (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Something went wrong: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                //Extract the infromation from the received json to get the translated string
                guard
                    let data = data,
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary,
                    let jsonData = json["data"] as? [String : Any],
                    let translations = jsonData["translations"] as? [NSDictionary],
                    let translation = translations.first as? [String : Any],
                    let translatedText  = translation["translatedText"] as? String
                    else {
                        return
                }
                //Pass the translatedText as a callback
                callback(translatedText)
                
            } catch {
                print("Serialization failed: \(error.localizedDescription)")
            }
        })
        
        httprequest.resume()
    }
}
