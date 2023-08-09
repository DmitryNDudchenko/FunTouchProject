//
//  AlViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 28.02.2023.
//

import UIKit
import Alamofire

class AlViewController: UIViewController {

    @IBOutlet weak var getMethodButton: UIButton!

    @IBOutlet weak var postMethodButton: UIButton!

    @IBOutlet weak var putMethodButton: UIButton!

    @IBOutlet weak var deleteMethodButton: UIButton!

    var detailsVCPrintedJSON: String?
    var detailsVCTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getMethodAction(_ sender: UIButton) {
        getMethod()
    }

    @IBAction func postMethodAction(_ sender: UIButton) {
        postMethod()
    }

    @IBAction func putMethodAction(_ sender: UIButton) {
        putMethod()
    }

    @IBAction func deleteMethodAction(_ sender: UIButton) {
        deleteMethod()
    }



    private func getMethod(){

        AF.request("https://my-json-server.typicode.com/typicode/demo/db", parameters: nil, headers: nil).validate(statusCode: 200..<299).responseData{ response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Connot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {return}
                        guard let prettyPrintJson = String(data: prettyJsonData, encoding: .utf8) else {return}
                        self.openDetailsVC(jsonString: prettyPrintJson, title: "Get Method")
                    }catch{
                        print("Error: \(error)")
                    }
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }
    let parametr: Parameters = [
        "name": "Dmitry",
        "salary": "3500",
        "age": "29"
    ]

    private func postMethod(){



        AF.request("https://my-json-server.typicode.com/typicode/demo", method: .post, parameters: parametr, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<299).responseData{ response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Connot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {return}

                        guard let prettyPrintJson = String(data: prettyJsonData, encoding: .utf8) else {return}

                        self.openDetailsVC(jsonString: prettyPrintJson, title: "Post Method")
                    }catch{
                        print("Error: \(error)")
                    }
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }

    private func putMethod(){

        let parametr: Parameters = [
            "name": "Dmitry Numerovsky",
            "job": "iOS Technical Lead",
            "salary": "5800"
        ]

        AF.request("https://my-json-server.typicode.com/typicode/demo", method: .put, parameters: parametr, headers: nil).validate(statusCode: 200..<299).responseData{ response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Connot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {return}

                        guard let prettyPrintJson = String(data: prettyJsonData, encoding: .utf8) else {return}

                        self.openDetailsVC(jsonString: prettyPrintJson, title: "Put Method")
                    }catch{
                        print("Error: \(error)")
                    }
                case .failure(let error):
                    print("Error: \(error)")
            }
        }

    }

    private func deleteMethod(){
        AF.request("https://my-json-server.typicode.com/typicode/demo", method: .delete, parameters: nil, headers: nil).validate(statusCode: 200..<299).responseData{ response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Connot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {return}

                        guard let prettyPrintJson = String(data: prettyJsonData, encoding: .utf8) else {return}

                        self.openDetailsVC(jsonString: prettyPrintJson, title: "Delete Method")
                    }catch{
                        print("Error: \(error)")
                    }
                case .failure(let error):
                    print("Error: \(error)")
            }
        }

    }


    func openDetailsVC(jsonString: String, title: String){
        detailsVCPrintedJSON = jsonString
        detailsVCTitle = title

        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "detailsseg", sender: self)
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if segue.identifier == "detailsseg"{
            let detViewController = segue.destination as? DetViewController
            detViewController?.title = detailsVCTitle
            detViewController?.jsonResults = detailsVCPrintedJSON ?? "No data"

        }


    }


}
