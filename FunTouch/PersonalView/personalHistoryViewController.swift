//
//  personalHistoryViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 14.03.2023.
//

import UIKit
import CoreData

struct Section {

    var expanded: Bool
    var indexRow: Int

}

class personalHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct Data{
        var message: String
        var date: String
    }

    var dataName: [Data] = []

    @IBOutlet var tableView: UITableView!
    var massIndexRow = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        massIndexRow.removeAll()
        dataName.removeAll()
        self.navigationItem.setHidesBackButton(true, animated: true)

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")

        do{
            let results = try managerCoreData.instance.context.fetch(fetchRequest)
            for result in results as! [Messages]{
                let name = result.message ?? "Все будет хорошо !"
                let date = result.date ?? "03 октября 2022"
               
                dataName.insert(Data(message: name, date: date), at: 0)
            }
        }catch{
            print(error)
        }

        dataName.forEach({print($0)})



        tableView.register(UINib(nibName: "textTableViewCell", bundle: .main), forCellReuseIdentifier: "TextTableViewCell")

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController!.navigationBar.isHidden = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataName.count
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as? TextTableViewCell else {
            print("faild to get cell")
            return UITableViewCell()
        }

        cell.massegeLabel.text = dataName[indexPath.section].message
        cell.dataViewLabel.text = dataName[indexPath.section].date

        massIndexRow.append(Section(expanded: true, indexRow: indexPath.row))
        massIndexRow.forEach({print($0)})
        cell.bottomViewHV.isHidden = massIndexRow[indexPath.row].expanded

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if massIndexRow[indexPath.row].indexRow == indexPath.row, massIndexRow[indexPath.row].expanded == true{
            massIndexRow[indexPath.row].expanded = false
        } else if massIndexRow[indexPath.row].indexRow == indexPath.row, massIndexRow[indexPath.row].expanded == false {
            massIndexRow[indexPath.row].expanded = true
        }

        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
