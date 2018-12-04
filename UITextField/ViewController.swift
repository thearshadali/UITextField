//
//  ViewController.swift
//  UITextField
//
//  Created by Arshad Ali on 04/12/18.
//  Copyright © 2018 Arshad Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textField: UITextField = {
        let tf = UITextField(frame: CGRect.zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter your name"
        tf.allowsEditingTextAttributes = true  // when user select text and pop up appears with options style like bold ,italic
        tf.borderStyle = .roundedRect
        tf.becomeFirstResponder()
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(textField)
        addConstrains()
    }
    
    func addConstrains(){
        NSLayoutConstraint.activate([textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                    textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                                    textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)])
    }


}

