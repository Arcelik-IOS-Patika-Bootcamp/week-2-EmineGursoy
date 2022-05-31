//
//  ViewController.swift
//  NotificationCenterSample
//
//  Created by Emine Sinem Gursoy on 30.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Background color set
        self.view.backgroundColor = UIColor(named: "White")
        containerView.backgroundColor = UIColor(named: "White")
        
        //Label configured
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = UIColor(named: "DarkGray")
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "WELCOME"
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        
        //Button configured
        enterButton.setTitle("ENTER", for: .normal)
        enterButton.backgroundColor = UIColor(named: "Pink")
        enterButton.tintColor = .black
        enterButton.layer.cornerRadius = 20
        enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        //Notification definition
        let notificationCenter: NotificationCenter = .default
        notificationCenter.addObserver(self, selector: #selector(updateText), name: .notification, object: nil)
        
    }
    
    //The name information obtained using userinfo is written on the label by making some adjustments
    @objc func updateText(notification: NSNotification){
        guard let info = notification.userInfo else {return}
        if let currentText = info["text"] as? String {
            if currentText == "" {
                self.label.text = "WELCOME \n BACK!"
            }
            else {
                self.label.text = "WELCOME \n \(currentText.uppercased())!"
                
            }
           
        }
   
    }
    //Switch to page two
    @IBAction func enterButtonClicked(_ sender: Any) {
        
        self.label.text = ""
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let second = main.instantiateViewController(identifier: "SecondVC")
        self.present(second, animated: true, completion: nil)
     }
    
}
