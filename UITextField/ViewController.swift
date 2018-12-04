//
//  ViewController.swift
//  UITextField
//
//  Created by Arshad Ali on 04/12/18.
//  Copyright © 2018 Arshad Ali. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var textField: UITextField = {
        let tf = UITextField(frame: CGRect.zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter your name"
        tf.allowsEditingTextAttributes = true  // when user select text and pop up appears with options style like bold ,italic
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    var textFieldBottom: UITextField = {
        let tf = UITextField(frame: CGRect.zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter your name"
        tf.allowsEditingTextAttributes = true  // when user select text and pop up appears with options style like bold ,italic
        tf.borderStyle = .roundedRect
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(textField)
        view.addSubview(textFieldBottom)
        addConstrains()
        textField.delegate = self
        textFieldBottom.delegate = self
        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
         notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }
    
    @objc func adjustForKeyboard (notification: Notification){
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
             //
        }
    }
    
    func addConstrains(){
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
             textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)])
        
        NSLayoutConstraint.activate([
            textFieldBottom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            textFieldBottom.heightAnchor.constraint(equalToConstant: 50),
            textFieldBottom.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textFieldBottom.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)])
    }


}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

