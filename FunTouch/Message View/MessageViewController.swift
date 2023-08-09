//
//  MessageViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 21.12.2022.
//

import UIKit
import CoreData

struct Variables {
    static var countTry = 0
    static var timing = ""
}

class MessageViewController: UIViewController {

    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var labelMessage: UITextView!

    @IBOutlet weak var buttonTimer: UIButton!

    var alert = Alerts()
    var timer = Timer()
    var hours = 00
    var minutes = 00
    var second = 10
    var countsTaps = 0
    var hourp: String = ""
    var minutesp: String = ""
    var secp: String = ""




    override func viewDidLoad() {
        super.viewDidLoad()

        fetchReqMassege()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        ViewConfig.viewCon.configButton(buttonTimer)
        messageView.layer.cornerRadius = 50
    }


    private func fetchReqMassege(){

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")

        do{
            let results = try managerCoreData.instance.context.fetch(fetchRequest)
            for result in results as! [Messages]{
                let name = result.message ?? "Все будет хорошо ?"
                labelMessage.text = name
            }
        }catch{
            print(error)
        }


    }

    @objc func countDown(){

        second = second - 1

        if (second < 0){
            second = 59
            minutes = minutes - 1
            if (minutes < 0){
                minutes = 59
                hours = hours - 1

                if (hours < 0){
                    hours = 0
                    minutes = 0
                    second = 0

                    timer.invalidate()
                }
            }
        }

        if (hours < 10) {
            hourp = "0" + String(describing: hours)
        } else {
            hourp = String(describing: hours)
        }

        if (minutes < 10 ) {
            minutesp = "0" + String(describing: minutes)
        } else {
            minutesp = String(describing: minutes)
        }

        if (second < 10){
            secp = "0" + String(describing: second)
        }else {
            secp = String(describing: second)
        }

        Variables.timing = hourp + ":" + minutesp + ":" + secp

        print(Variables.timing)


        if hours == 0 && minutes == 0 && second == 0 {

            FunTouch.Alerts().showSimpleAlert(controller: self, title: "Timer Message", message: "Отсчет заверщен !")
            timer.invalidate()
            minutes = 00
            second = 10


        } else {
            let myNormalAttributedTitle = NSAttributedString(string: "Click Here",
                                                                     attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
            buttonTimer.setAttributedTitle(myNormalAttributedTitle,for:.normal)

        }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonTryTest(_ sender: UIButton) {

        Variables.countTry += 1

        if Variables.countTry >= 3{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)

            let ADSVC = ADSViewController()
            navigationController?.pushViewController(ADSVC, animated: true)
           

        }else{
            let ADSVC = InteractiveView()
            navigationController?.pushViewController(ADSVC, animated: true)
        }

    }

    @IBAction func personalVC(_ sender: UIButton) {
        let personVC = personalHistoryViewController()
        navigationController?.pushViewController(personVC, animated: true)
    }

}
