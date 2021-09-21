//
//  ViewController.swift
//  ElasticTextView
//
//  Created by Osamu Hiraoka on 2021/09/21.
//

import UIKit

class ElasticTextViewController: UIViewController {

    @IBOutlet weak private var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func openKeyboardButtonTapped() {
        textView.becomeFirstResponder()
    }
    
    @IBAction private func closeKeyboardButtonTapped() {
        
    }
}

