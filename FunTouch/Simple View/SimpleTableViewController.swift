//
//  SimpleTableViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 23.12.2022.
//

import UIKit

class SimpleTableViewController: UITableViewController {

    var idioms = ["Слышишь шаги? Чудеса уже близко !","Твоя доброта меняет мир в точке","Берегите свои мысли от хандры","Твоя любовь к себе спасает мир !","Принимай подарки смело и не жди подвоха","Жизнь прекрастна, иди ей на встречу !","Протяни руку на встречу возможностям"]


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0

        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        tableView.reloadData()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idioms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SimpleTableViewCell else {
            print("fail to get cell")
            return UITableViewCell()
        }

        cell.lableCell.text = idioms[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle ,forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            tableView.beginUpdates()
            idioms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
        if editingStyle == .insert {
            tableView.beginUpdates()
            idioms.append("Hi, i am new row )))")
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }

}
