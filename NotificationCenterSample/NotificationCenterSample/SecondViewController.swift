//
//  SecondViewController.swift
//  NotificationCenterSample
//
//  Created by Emine Sinem Gursoy on 30.05.22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Background color set
        self.view.backgroundColor = UIColor(named: "White")
        containerView.backgroundColor = UIColor(named: "White")
        
        //TextField configured
        nameTextField.textColor = .black
        nameTextField.backgroundColor = UIColor(named: "LightGray")
        nameTextField.placeholder = "Enter your name..."
        nameTextField.layer.cornerRadius = 20
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.cornerRadius = 10
        
        //Button configured
        enterButton.tintColor = .black
        enterButton.backgroundColor =  UIColor(named: "Pink")
        enterButton.setTitle("ENTER", for: .normal)
        enterButton.layer.cornerRadius = 20
        enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
 
    
    
    @IBAction func enterButtonClicked(_ sender: Any) {
        //The value written in the text field is written to the text constant
        guard let text = nameTextField.text else {return}
        
        //The name information in the text constant is sent using userInfo when requested
        NotificationCenter.default.post(name:  .notification, object: nil, userInfo: ["text" : text])
        
        //The presented ViewController is closed
        dismiss(animated: true, completion: nil)
    }
    
}

