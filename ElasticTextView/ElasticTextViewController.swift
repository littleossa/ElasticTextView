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
        textView.becomeFirstResponder()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @IBAction private func openKeyboardButtonTapped() {
        textView.becomeFirstResponder()
    }
    
    @IBAction private func closeKeyboardButtonTapped() {
        textView.resignFirstResponder()
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height,
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
        let KeyboardAnimationCurve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
        else { return }
        
        UIView.animate(withDuration: keyboardAnimationDuration,
                       delay: 0,
                       options: UIView.AnimationOptions(rawValue: KeyboardAnimationCurve)) {
            self.textViewButtonConstraint.constant = keyboardHeight
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
        let KeyboardAnimationCurve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
        else { return }
        
        UIView.animate(withDuration: keyboardAnimationDuration,
                       delay: 0,
                       options: UIView.AnimationOptions(rawValue: KeyboardAnimationCurve)) {
            self.textViewButtonConstraint.constant = 0
        }
    }
}
