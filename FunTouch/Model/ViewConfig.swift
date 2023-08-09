//
//  ViewConfig.swift
//  FunTouch
//
//  Created by Дмитрий on 14.12.2022.
//

import Foundation
import UIKit

class ViewConfig {
    //MARK: - Class Singlton
    static let viewCon: ViewConfig = {
        let instance = ViewConfig()
        return instance
    }()

    private init(){}



    func configTextField(_ name: UITextField?){
        name?.textColor = UIColor.white
        name?.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 0)
        //#colorLiteral()
        name?.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3991776018)
        name?.layer.borderWidth = 1.0
        name?.layer.cornerRadius = 14

        name?.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
        name?.layer.shadowRadius = 14.0
        name?.layer.shadowOffset = CGSize(width: 0, height: 4)
        name?.layer.shadowOpacity = 1

    }

    func configButton(_ button: UIButton?){

        if (button!.isEnabled) {
           
            button?.layer.cornerRadius = 16.0
            button?.backgroundColor = UIColor.white
            button?.setTitleColor(.black, for: .normal)
        }else{
            button?.layer.cornerRadius = 16.0
            button?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3991776018)
            button?.setTitleColor(.darkGray, for: .normal)
        }
        
    }

}
