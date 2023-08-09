//
//  EmojiTableViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 25.12.2022.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis: [Emojis] = [
        Emojis(symbol: "💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift)", usage: "apps, macBook, iOS"),
        Emojis(symbol: "🎆", name: "Splash", description: "jlkasjdlkjaskld", usage: "some usage"),
        Emojis(symbol: "📱", name: "Iphone", description: "jkhadhaslkdasd", usage: "some usage"),
        Emojis(symbol: "💽", name: "CD-Disk", description: "asdasdasdas", usage: "some usage"),
        Emojis(symbol: "🍘", name: "Some food", description: "asdasdasadsad", usage: "some usage"),
        Emojis(symbol: "🍿", name: "PopCorn", description: "sadsadasdadad", usage: "some usage"),
        Emojis(symbol: "🧶", name: "Some Ini", description: "asdasdasdasdas", usage: "some usage"),
        Emojis(symbol: "⛑️", name: "Medic", description: "asdasasd", usage: "some usage"),
        Emojis(symbol: "🪖", name: "Military", description: "adkjhdkjhahdjlasd", usage: "some usage")

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }


    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any? ) -> AddEditEmojiTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else {
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }

    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue){
        guard segue.identifier == "saveUnwind", let sourceViewController = segue.source as? AddEditEmojiTableViewController, let emoji = sourceViewController.emoji else {return}

        if let secetedIndexPath = tableView.indexPathForSelectedRow {
            emojis[secetedIndexPath.row] = emoji
            tableView.reloadRows(at: [secetedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }

    }


}

extension EmojiTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as? EmojiTableViewCell else {
            return UITableViewCell()
        }

        let emoji = emojis[indexPath.row]

        cell.update(with: emoji)
        cell.showsReorderControl = true

        return cell

    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
    }

}
