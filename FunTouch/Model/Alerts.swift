//
//  Alerts.swift
//  FunTouch
//
//  Created by Дмитрий on 18.12.2022.
//

import UIKit

class Alerts: NSObject {

    func showSimpleAlert(controller: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {(_) in print("Approve Button")}))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_: UIAlertAction?) in } ))

        controller.present(alert, animated: true)

    }

    func showSimpleActionSheets(controller: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Default", style: .default, handler: {(_) in print("Default Button")}))
        alert.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: {(_) in print("Destructive Button")} ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in print("Cancel Button")} ))

        controller.present(alert, animated: true, completion: {print("Задача завершина")})
    }

    func showAlertWithTreeButton(controller: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: {(_) in print("Approve Button")}))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {(_) in print("Delete Button")} ))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {(_) in print("Dismiss Button")}))

        controller.present(alert, animated: true, completion: {print("Задача завершина")})

    }

    func showAlertWithTextField(controller: UIViewController, title: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: "Add", style: .default){_ in
            if let txtField = alert.textFields?.first, let text = txtField.text {
                let textOut = UserDefaults.standard.set(text, forKey: "text")
                print("TExt from Alerts -> \(text)")
            }
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel){_ in }
        alert.addTextField{(textField) in textField.placeholder = "Введите Email"}

        alert.addAction(confirmAction)
        alert.addAction(cancel)

        controller.present(alert, animated: true, completion: nil)


    }

}
