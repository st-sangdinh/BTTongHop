//
//  FavoriteVC.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 18/04/2022.
//

import UIKit

// Sử dụng DataSrouce để lấy data từ cái tab với nhau
protocol FavoriteDataSrouce: AnyObject {
//    Yêu cầu 1 file bất kì nào đó trả về 1 cái menu
    func listFavorites() -> [Menu]
}

class FavoriteVC: UIViewController {

    weak var datasource: FavoriteDataSrouce?
//    var homeVC = HomeVC()

    var data: [Menu] {
        datasource?.listFavorites() ?? []
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite"
        // Do any additional setup after loading the view.
        configTabelView()
//        homeVC.delegate = self
    }
    private func configTabelView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
    }
}

extension FavoriteVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.isEmpty ? 0 : 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        if (data[indexPath.row].favorite == true){
            cell?.setDataFavorite(img: data[indexPath.row].img, name: data[indexPath.row].name, price: data[indexPath.row].price)
        }
        print(data[indexPath.row].favorite)
        return cell ?? UITableViewCell()
    }
}
//
//extension FavoriteVC: HomeVCDelegate {
//    func view(_ view: HomeVC, _ action: HomeVC.Action) {
//        switch action {
//        case .reloadData:
//            tableView.reloadData()
//        }
//    }
//}
