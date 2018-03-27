//
//  ViewController.swift
//  PushNotificationDemo
//
//  Created by Dmitrii Ziablikov on 26.03.2018.
//  Copyright © 2018 Dmitrii Ziablikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tokenLabel: UILabel!
    
    @IBOutlet weak var copyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tokenLabel.layer.cornerRadius = 4
        tokenLabel.clipsToBounds = true
        
        copyButton.layer.cornerRadius = 4
        copyButton.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tokenLabel.text = UserDefaults.standard.value(forKey: "token") as? String
    }
    
    @IBAction func copyButtonTapped(_ sender: UIButton) {
        guard let token = tokenLabel.text else { return }
        UIPasteboard.general.string = token
        
        let alert = UIAlertController(title: "Device token is copied!", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
}

