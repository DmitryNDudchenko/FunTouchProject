//
//  DetViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 28.02.2023.
//

import UIKit

class DetViewController: UIViewController {

    @IBOutlet weak var jsonResultsTextView: UITextView!
    var jsonResults = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        jsonResultsTextView.text = jsonResults
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
