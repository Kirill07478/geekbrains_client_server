//
//  LoginViewController.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 17.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        loginScrollView?.addGestureRecognizer(hideKeyboardGesture)

    }
    
    //MARK: - Action Button
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginScrollView: UIScrollView!
    
    //MARK: - Keybord
    
    @objc func keyboardWasShown(notification: Notification) {
            
            // Получаем размер клавиатуры
            let info = notification.userInfo! as NSDictionary
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            
            // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
            self.loginScrollView?.contentInset = contentInsets
        loginScrollView?.scrollIndicatorInsets = contentInsets
        }
        
    @objc func keyboardWillBeHidden(notification: Notification) {
            // Устанавливаем отступ внизу UIScrollView, равный 0
            let contentInsets = UIEdgeInsets.zero
            loginScrollView?.contentInset = contentInsets
        }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    @objc func hideKeyboard() {
            self.loginScrollView?.endEditing(true)
        }
    
    //MARK: - Segues
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            let checkResult = checkUserData()
            if !checkResult {
                showLoginError()
            }
            return checkResult
        }

        func checkUserData() -> Bool {
//            guard let login = loginInput.text,
//                let password = passwordInput.text else { return false }
//
//            if login == "admin" && password == "123" {
//                return true
//            } else {
//                return false
//            }
            return true
        }
        
        func showLoginError() {
            let alter = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alter.addAction(action)
            present(alter, animated: true, completion: nil)
        }


}
