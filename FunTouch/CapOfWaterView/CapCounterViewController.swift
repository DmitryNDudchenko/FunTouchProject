//
//  CapCounterViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 29.01.2023.
//

import UIKit

class CapCounterViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!

    // Label outlets
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    var isGraphViewShowing = false

    override func viewDidLoad() {
        super.viewDidLoad()

        counterLabel?.text = String(counterView.counter)
    }
    

    @IBAction func pushButtonPressed(button: PushButton){
        if button.isAddButton{
            counterView.counter += 1
        } else {
                if counterView.counter > 0 {
                    counterView.counter -= 1
                }
            }
        counterLabel?.text = String(counterView.counter)

        if isGraphViewShowing {
            counterViewTap(nil)
        }


    }

    @IBAction func counterViewTap(_ gesture: UITapGestureRecognizer?) {
      if isGraphViewShowing {
        UIView.transition(
          from: graphView,
          to: counterView,
          duration: 1.0,
          options: [.transitionFlipFromLeft, .showHideTransitionViews],
          completion: nil
        )
      } else {
        setupGraphDisplay()
        UIView.transition(
          from: counterView,
          to: graphView,
          duration: 1.0,
          options: [.transitionFlipFromRight, .showHideTransitionViews],
          completion: nil
        )
      }
      isGraphViewShowing.toggle()
    }

    func setupGraphDisplay() {
      let maxDayIndex = stackView.arrangedSubviews.count - 1

      graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
      graphView.setNeedsDisplay()
      maxLabel.text = "\(graphView.graphPoints.max() ?? 0)"

      let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
      averageWaterDrunk.text = "\(average)"

      let today = Date()
      let calendar = Calendar.current

      let formatter = DateFormatter()
      formatter.setLocalizedDateFormatFromTemplate("EEEEE")

      for i in (0...maxDayIndex) {
        if let date = calendar.date(byAdding: .day, value: -i, to: today),
          let label = stackView.arrangedSubviews[maxDayIndex - i] as? UILabel {
          label.text = formatter.string(from: date)
        }
      }
    }


}
