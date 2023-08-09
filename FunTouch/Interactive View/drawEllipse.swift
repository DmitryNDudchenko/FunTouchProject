//
//  drawEllipse.swift
//  FunTouch
//
//  Created by Дмитрий on 27.01.2023.
//

import UIKit
@IBDesignable
class drawEllipse: UIView {

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}

        let shadowOffset = CGSize(width: 15, height: 15)
        let blur = CGFloat(100)

        context.setShadow(offset: shadowOffset, blur: blur, color: UIColor.black.cgColor)
        
        let rectangle = CGRect(x: 50, y: 50, width: 250, height: 250)
        context.addEllipse(in: rectangle)

        context.setFillColor(UIColor.yellow.cgColor)

        context.fillPath()

    }

}
