//
//  drawFigure.swift
//  FunTouch
//
//  Created by Дмитрий on 27.01.2023.
//

import UIKit
@IBDesignable
class drawTriangle: UIView {

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}

        context.setLineWidth(4.0)

        context.setStrokeColor(UIColor.yellow.cgColor)

        context.move(to: CGPoint(x: 150, y: 50))
        context.addLine(to: CGPoint(x: 250, y: 250))
        context.addLine(to: CGPoint(x: 50, y: 250))
        context.addLine(to: CGPoint(x: 150, y: 50))

        context.strokePath()

    }


}
