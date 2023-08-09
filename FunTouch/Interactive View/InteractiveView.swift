//
//  InteractiveView.swift
//  FunTouch
//
//  Created by Дмитрий on 14.12.2022.
//

import UIKit
import CoreData

class InteractiveView: UIViewController {

    let idioms = ["Слышишь шаги ? Чудеса уже близко !","Твоя доброта меняет мир в точке","Берегите свои мысли от хандры", "Твоя любовь к себе спасает мир!", "Принимай подарки смело и не жди подвоха", "Жизнь прекрастна, иди ей на встречу!","Протяни руку на встречу возможностям"]

    @IBOutlet weak var buttonNextOutlet: UIButton!

    @IBOutlet weak var topLabal: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        topLabal.adjustsFontSizeToFitWidth = true
        self.navigationController!.navigationBar.isHidden = true
        
        ViewConfig.viewCon.configButton(buttonNextOutlet)
        
    }

    @IBAction func buttonNext(_ sender: UIButton) {

        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        let index = Int(arc4random_uniform(UInt32(idioms.count-1)))

        let message = Messages(context: managerCoreData.instance.context)

        message.message = idioms[index]
        message.date = dateFormatter.string(from: date)

        managerCoreData.instance.saveContext()

        let nextVC = MessageViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }


}
