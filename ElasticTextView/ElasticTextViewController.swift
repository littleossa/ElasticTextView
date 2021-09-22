//
//  ViewController.swift
//  ElasticTextView
//
//  Created by Osamu Hiraoka on 2021/09/21.
//

import UIKit

class ElasticTextViewController: UIViewController {

    @IBOutlet weak private var textView: UITextView!
    @IBOutlet weak private var textViewButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @IBAction private func closeKeyboardButtonTapped() {
        textView.resignFirstResponder()
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        animateTextViewHeight(byKeyboardNotification: notification, willShowKeyboard: true)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        animateTextViewHeight(byKeyboardNotification: notification, willShowKeyboard: false)
    }
}

// MARK: - Helper Method
extension ElasticTextViewController {
    
    private func animateTextViewHeight(byKeyboardNotification notification: Notification,
                                       willShowKeyboard: Bool) {
        
        guard let keyboardHeight = willShowKeyboard ? notification.keyboardHeight : 0,
              let keyboardAnimationDuration = notification.keybaordAnimationDuration,
              let KeyboardAnimationCurve = notification.keyboardAnimationCurve
        else { return }
        
        UIView.animate(withDuration: keyboardAnimationDuration,
                       delay: 0,
                       options: UIView.AnimationOptions(rawValue: KeyboardAnimationCurve)) {
            self.textViewButtonConstraint.constant = keyboardHeight
        }
    }
}
