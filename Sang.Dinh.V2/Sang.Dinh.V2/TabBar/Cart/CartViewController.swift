//
//  CartViewController.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 15/04/2022.
//

import UIKit

class CartViewController: UIViewController {
    
    var datas: [Menu] = []
    var totalPrice = 0
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"
        let order = UIBarButtonItem(title: "Order", style: .done, target: self, action: #selector(order))
        navigationItem.rightBarButtonItem = order
        configTabelView()
    }
    private func configTabelView() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    @objc func order() {
        getPrice()
        let alert = UIAlertController(title: "Confirmation", message: "Would you like to order all items? Total \(totalPrice)", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    func getPrice () {
        for data in datas {
            if data.number > 0 {
                totalPrice += data.price * data.number
            }
        }
    }
}
extension CartViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        datas.isEmpty ? 0 : 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
        if datas[indexPath.item].number > 0 {
            cell?.setDataCart(img: datas[indexPath.row].img, name: datas[indexPath.row].name, price: datas[indexPath.row].price, quantity: datas[indexPath.row].number)
        }
        return cell ?? UITableViewCell()
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
