//
//  GradientView.swift
//  FunTouch
//
//  Created by Дмитрий on 18.12.2022.
//

import UIKit

@IBDesignable class GradientView: UIView {

   var gradientLayer = CAGradientLayer()

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) {
        didSet {
            gradientLayer.colors = [topColor.cgColor, topButton.cgColor]
        }
    }

    @IBInspectable  var topButton: UIColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) {
        didSet {
            gradientLayer.colors = [topColor.cgColor, topButton.cgColor]
        }
    }


    @IBInspectable var startDirection: CGPoint = CGPoint(x: 0.0, y: 0.0){
        didSet{
            gradientLayer.startPoint = startDirection
        }
    }

    @IBInspectable var endDirection: CGPoint = CGPoint(x: 0.0, y: 0.0){
        didSet{
            gradientLayer.endPoint = endDirection
        }
    }

    override func layoutSubviews() {
        gradientLayer.frame = self.bounds

        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
