//
//  MainTableViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 03.03.2023.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController{

    var films: [Film] = []
    var item: [Displayable] = []
    var selectedItem: Displayable?

    @IBOutlet weak var searchBar: UISearchBar!


    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

        fetchFilms()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let item = item[indexPath.row]
        cell.textLabel?.text = item.titleLabelText
        cell.detailTextLabel?.text = item.subtitleLabelText

        return cell

    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = item[indexPath.row]
        return indexPath
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailViewController else {
            return
        }
        destinationVC.data = selectedItem
    }

}

extension MainTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let shipName = searchBar.text else {return}
        searchStarships(for: shipName)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        item = films
        tableView.reloadData()
    }
}

extension MainTableViewController {

    private func fetchFilms(){
        let url = "https://swapi.dev/api/films"
        AF.request(url).validate().responseDecodable(of: Films.self) { (response) in
            guard let films = response.value else {return}
            self.films = films.all
            self.item = films.all
            self.tableView.reloadData()
        }
    }

    private func searchStarships(for name: String){
        let url = "https://swapi.dev/api/starships"
        let parametrs: [String: String] = ["search": name]

        AF.request(url,parameters: parametrs).validate().responseDecodable(of: Starships.self){ respons in
            guard let starships = respons.value else {return}

            self.item = starships.all

            self.tableView.reloadData()

        }


    }

}
