// Twitter
// TweetViewController.swift
// Created by Lucas Benda on  10/2/22 AT 3:06 PM.
// Copyright © 2022 Dan. All rights reserved.
// Swift version  5.0
// Running on macOS 12.5


import UIKit
import RSKPlaceholderTextView

class TweetViewController: UIViewController, UITextViewDelegate {
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var tweetTextView: UITextView!

    @IBOutlet weak var tweetTextBox: UITextField!
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string : String) -> Bool{
        if range.length + range.location > count(tweetTextBox.text) {
            
            return false
        }
        let NewLength = count(tweetTextBox.text) + count(string) - range.length
        
         
    }
    
    // Compose new tweet
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error printing tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set placeholder and color
        self.tweetTextView.text = "Start typing your tweet here"
        self.tweetTextView.textColor = UIColor.lightGray
        
        self.view.addSubview(self.tweetTextView)
        
        tweetTextView.becomeFirstResponder()
        
        tweetTextView.delegate = self

    }
    
    func textView(_ tweetTextView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Set the max character limit
        let characterLimit = 140
        
        // Combine the tweetTextView text and the replacement text to create the updated text string
        let currentText:String = tweetTextView.text
        let newText = NSString(string: tweetTextView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    
        // If updated text view will be empty, add the placeholder and set the cursor to the beginning of the text view
        if newText.isEmpty {

            tweetTextView.text = "Start typing your tweet here"
            tweetTextView.textColor = UIColor.lightGray

            tweetTextView.selectedTextRange = tweetTextView.textRange(from: tweetTextView.beginningOfDocument, to: tweetTextView.beginningOfDocument)
        }

        // Else if the text view's placeholder is showing and the length of the replacement string is greater than 0, set the text color to black then set its text to the replacement string
         else if tweetTextView.textColor == UIColor.lightGray && !text.isEmpty {
            tweetTextView.textColor = UIColor.black
            tweetTextView.text = text
        }

        // For every other case, the text should change with the usual behavior...
        else {
            return true
        }

        // ...otherwise return false since the updates have already been made
        return false
    }
    
    // Prevent user from changing position of cursor while placeholder is visible
    func textViewDidChangeSelection(_ tweetTextView: UITextView) {
        if self.view.window != nil {
            if tweetTextView.textColor == UIColor.lightGray {
                tweetTextView.selectedTextRange = tweetTextView.textRange(from: tweetTextView.beginningOfDocument, to: tweetTextView.beginningOfDocument)
            }
        }
    }
    
}
