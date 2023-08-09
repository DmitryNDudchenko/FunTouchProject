//
//  AlertsView.swift
//  FunTouch
//
//  Created by Дмитрий on 18.12.2022.
//

import UIKit

class AlertsView: UIViewController {

    var alerts = Alerts()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alerts View"
        // Do any additional setup after loading the view.
    }



     @IBAction func buttonExit(_ sender: UIButton) {
         self.dismiss(animated: true)
     }

    @IBAction func alerts1(_ sender: UIButton) {
        alerts.showSimpleAlert(controller: self, title: "Регистрация", message: "По нажатию вы будете зарегестрированы")
    }

    @IBAction func alerts2(_ sender: UIButton) {
        alerts.showSimpleActionSheets(controller: self, title: "Menu", message: "Варианты действий ")
    }
    
    @IBAction func alerts3(_ sender: UIButton) {
        alerts.showAlertWithTreeButton(controller: self, title: "Alert", message: "Предупреждение с трем кнопками")
    }
    @IBAction func alerts4(_ sender: UIButton) {
        alerts.showAlertWithTextField(controller: self, title: "Alert with textField")
    }
}
