//
//  ViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 09.12.2022.
//

import UIKit
import GoogleMobileAds
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var buttonContin: UIButton!

    struct Constant {
        static let homeAdID = "ca-app-pub-3940256099942544/5135589807"
    }

    private var interstitial: GADInterstitialAd?

    let generator = UIImpactFeedbackGenerator(style: .heavy) //Инициализация обьекта UIImpactFeedbackGenerator для фидбека вибрацией. Параметр style: определяет тип виброотклика

    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataManager()
        swipeNavigation()
        buttonContin?.layer.cornerRadius = 16

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func coreDataManager(){
        //Создаем ссылку на AppDelegate
       // let appDelegate = UIApplication.shared.delegate as! AppDelegate

        //Создаем контектс
       // let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext

        //Нужно описать сущность с которой будем работать
       // let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: context)

        //let manegerObject = NSManagedObject(entity: entityDescription!, insertInto: context)

       // let manegerObject = User(entity: entityDescription!, insertInto: context)

        //Установка значений в поля сущности

        let entityUser = User()

        entityUser.name = "Vladislav"
        entityUser.female = "Female"
        entityUser.age = 22


        // Сохранение данных
        managerCoreData.instance.saveContext()


        let name =  entityUser.name
        let age = entityUser.age
        let female = entityUser.female

        print("Name ->\(name ?? "non"), age -> \(age), Female -> \(female ?? "non")")

        // Создали запрос на извлечение данных из Core Data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let results = try managerCoreData.instance.context.fetch(fetchRequest)
            for result in results as! [User] {
                print("Name ->\(result.name ?? "non"), age -> \(result.age), Female -> \(result.female ?? "non")")
            }
        }catch{
            print(error)
        }

        do{
            let results = try managerCoreData.instance.context.fetch(fetchRequest)
            for result in results as! [User] {
                managerCoreData.instance.context.delete(result)
            }
        }catch{
            print(error)
        }

        managerCoreData.instance.saveContext()



    }

    private func swipeNavigation(){
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeUP.direction = .up
        self.view.addGestureRecognizer(swipeUP)

    }

    @IBAction func buttonNavigation(_ sender: UIButton) {
        generator.impactOccurred() //Имплементация виброотклика по нажатию кнопки
    }


    @objc private func swipeFunc(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .up {

            generator.impactOccurred() // Инициализация виброотклика при свайпе вверх
            performSegue(withIdentifier: "upID", sender: self)

        }
    }

    @IBAction func regViewButton(_ sender: UIButton) {

       // registrationView.modalPresentationStyle = .fullScreen
        let isReg: Bool = UserDefaults.standard.bool(forKey: "isReg")
        print(isReg)
        let nextView: UIViewController
        isReg == true ? (nextView = InteractiveView()) : (nextView =  registrationView())
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @IBAction func goToAlertsView(_ sender: UIButton) {
        let alertsVC = AlertsView()
        alertsVC.modalPresentationStyle = .fullScreen
        self.present(alertsVC, animated: true)

    }

    @IBAction func moveToSimpleTableView(_ sender: UIButton) {
        let simpleViewTable = SimpleTableViewController()
        navigationController?.pushViewController(simpleViewTable, animated: true)
    }

    @IBAction func moveToEmojiTableView(_ sender: UIButton) {

    }

    //MARK: - URLSession Begin
    var imageWidth = "300"
    var imageHeight = "500"
    var counter: Int = 0
    // "https://picsum.photos/"

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func getImageButtonPressed(_ sender: UIButton) {

        //1) Подключить к API ресурса
        let API = "https://picsum.photos/" + imageWidth + "/" + imageHeight

        //2) Создаем URL
        guard let apiURL = URL(string: API) else {fatalError("Some Errore")}

        //3) Инициализация сессия
        let session = URLSession(configuration: .default)

        //4) Создаем Запрос
        let task = session.dataTask(with: apiURL) { (data, response, error) in
            //5) Обрабатываем полученную подель данных
            guard let data = data, error == nil else {return}

            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        //6) Инициализация запроса
        task.resume()


    }
    //MARK: - URLSession End

}


