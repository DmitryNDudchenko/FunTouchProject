//
//  registrationView.swift
//  FunTouch
//
//  Created by Дмитрий on 14.12.2022.
//

import UIKit

class registrationView: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var registerButton: UIButton!

    @IBOutlet weak var contineButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        configView()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(sender: NSNotification){
        self.view.frame.origin.y = -120
    }

    @objc func keyboardWillHide(sender: NSNotification){
        self.view.frame.origin.y = 0
    }

    func configView(){
        nameTextField.delegate = self
        ageTextField.delegate = self
        emailTextField.delegate = self

        ViewConfig.viewCon.configTextField(nameTextField)
        ViewConfig.viewCon.configTextField(ageTextField)
        ViewConfig.viewCon.configTextField(emailTextField)
        ViewConfig.viewCon.configButton(registerButton)
        
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if nameTextField.text == "" || ageTextField.text == "" || emailTextField.text == "" {
            registerButton.isEnabled = false
            configView()
        } else {
            registerButton.isEnabled = true

            configView()
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField || textField == ageTextField || textField == emailTextField {
            textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField || textField == ageTextField || textField == emailTextField {
            textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3991776018)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    @IBAction func moveToInteractiveView(_ sender: UIButton) {
        let nextVC = InteractiveView()
        navigationController?.pushViewController(nextVC, animated: true)
        let isReg = true
        UserDefaults.standard.set(isReg, forKey: "isReg")
       

    }

    @IBAction func skipButton(_ sender: UIButton) {
        let nextVC = InteractiveView()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


        if textField.text!.last == " "  && string == " "{
              return false
             }
          if emailTextField.text!.last == "@"  && string == "@"{

             return false
            }
          if emailTextField.text!.last == "."  && string == "."{

             return false
            }
          if emailTextField.text!.last == "_"  && string == "_"{
             return false
            }

          if textField.text?.count == 0 && string == " " {
                  return false
              }

          if textField.text?.count == 0 && string == "." {
                  return false
              }
          if textField.text?.count == 0 && string == "@" {
                  return false
              }
          if textField.text?.count == 0 && string == "_" {
                  return false
              }

         if textField == nameTextField {
              let allowedCharacters = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZабвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ")
              let characterSet = CharacterSet(charactersIn: string)
              return allowedCharacters.isSuperset(of: characterSet)

          }

          if textField == emailTextField {
              let allowedCharacters = CharacterSet(charactersIn:"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZабвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ_.@")
              let characterSet = CharacterSet(charactersIn: string)
              return allowedCharacters.isSuperset(of: characterSet)

          }

          if textField == ageTextField {
              let allowedCharacters = CharacterSet(charactersIn:"0123456789")
              let characterSet = CharacterSet(charactersIn: string)
              return allowedCharacters.isSuperset(of: characterSet)

          }

          if range.location == 0 && string == " " {
                    return false
                }

        return true
    }


}
