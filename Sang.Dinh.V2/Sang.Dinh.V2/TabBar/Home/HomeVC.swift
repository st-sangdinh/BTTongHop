//
//  HomeTabBarVC.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 15/04/2022.
//

import UIKit

protocol HomeVCDelegate: AnyObject {
    func view(_ view: HomeVC, _ action: HomeVC.Action)
}

class HomeVC: UIViewController {
    
    enum Action {
        case reloadData
    }

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var menuCollectionView: UICollectionView!

    let favoriteVC = FavoriteVC()
    weak var delegate: HomeVCDelegate!
    
    var listMenu: [Menu] = []
    var lastOrder: [Menu] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Home"
        let cartButton = UIBarButtonItem(image: UIImage(named: "cart"), style: .done, target: self, action: #selector(cartButton))
        cartButton.tintColor = UIColor(red: 0.486, green: 0.525, blue: 0.569, alpha: 1)
        navigationItem.rightBarButtonItem = cartButton
        
        

        bannerCollectionView.register(UINib(nibName: "BannerCustomViewCell" , bundle: nil), forCellWithReuseIdentifier: "BannerIMG")

        menuCollectionView.register(UINib(nibName: "HeaderCRV", bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header"
        )
        menuCollectionView.register(UINib(nibName: "CollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "Menu")

        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.delegate  = self

        favoriteVC.datasource = self
        setUpData()
    }

    func setUpData() {
        listMenu = [Menu(name: "abc1", price: 15000, img: UIImage(named: "p-1")!, number: 0, favorite: false ),
                    Menu(name: "abc2", price: 125000, img: UIImage(named: "p-2")!, number: 0, favorite: false),
                    Menu(name: "abc3", price: 153000, img: UIImage(named: "p-3")!, number: 0, favorite: false),
                    Menu(name: "abc4", price: 150200, img: UIImage(named: "p-4")!, number: 0, favorite: false),
                    Menu(name: "ab34", price: 150200, img: UIImage(named: "p-4")!, number: 0, favorite: false),
                    Menu(name: "ab34", price: 150200, img: UIImage(named: "p-4")!, number: 0, favorite: false),
                    Menu(name: "ab34", price: 150200, img: UIImage(named: "p-4")!, number: 0, favorite: false),
                    Menu(name: "ab34", price: 150200, img: UIImage(named: "p-4")!, number: 0, favorite: false),
                    Menu(name: "ab34", price: 150200, img: UIImage(named: "p-4")!, number: 0, favorite: false),
                    Menu(name: "ab34", price: 150200, img: UIImage(named: "p-4")!, number: 0, favorite: false)
        ]
    }
    
    @objc
    func cartButton() {
        let vc = CartViewController()
        vc.datas = listMenu
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == menuCollectionView {
            return 2
        }else {
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView {
            if section == 0 {
                return listMenu.count
            } else {
                return 0 // Tra ve danh sach `last order`
            }
        } else {
            return 3
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Menu", for: indexPath) as? CollectionViewCell
            if (indexPath.section == 0 ){
                let menu = listMenu[indexPath.item]
                cell?.setData(img: menu.img,
                              name: "\(menu.name)",
                              price: menu.price,
                              number: menu.number,
                              isFavorite: menu.favorite)
            }
//            print("dsd\(listMenu[indexPath.item].number)")
            cell?.delegate = self
            return cell ?? CollectionViewCell()
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerIMG", for: indexPath) as! BannerCustomViewCell
            let indexPathItem = indexPath.item
            switch indexPathItem{
            case 0:
                cell.bannerIMG(img: UIImage(named: "bannerImg.png")!)
            case 1:
                cell.bannerIMG(img: UIImage(named: "bannerImg2.png")!)
            case 2:
                cell.bannerIMG(img: UIImage(named: "bannerImg3.png")!)
            default:
                 return cell
            }
//            if (indexPath.item == 0 ){
//                cell.bannerIMG(img: UIImage(named: "bannerImg.png")!)
//            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader where collectionView == menuCollectionView:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "Header", for: indexPath
            ) as? HeaderCRV
            if indexPath.section == 0 {
                header?.updateTitle("Restaurants")
            } else {
                header?.updateTitle("Last Order")
            }

            return header ?? UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
}
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuCollectionView{
            let leftSpacing = 20
            let width  = (Int(UIScreen.main.bounds.width) - (leftSpacing * 2) - 10) / 2
            let height = bannerCollectionView.bounds.size.height
            return CGSize(width: width, height: 300)
        } else {
            
            let height = bannerCollectionView.bounds.size.height
            let width  = bannerCollectionView.bounds.size.width
                
            return CGSize(width: width , height: height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == menuCollectionView {
           return UIEdgeInsets(top: 17, left: 0, bottom: 30, right: 0)
        }else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == menuCollectionView {
            return CGSize(width: 0, height: 19)
        }else {
            return  .zero
        }
    }
}
// Tạo 1 func để kết nối
extension HomeVC: FavoriteDataSrouce {
    func listFavorites() -> [Menu] {
        listMenu.filter { item in
            return item.favorite
        }
    }
}

//extension HomeVC: FoodCollectionViewDelegate {
////    func updateFavorite(cell: CollectionViewCell, favorite: Bool) {
////        if let indexPath = menuCollectionView.indexPath(for: cell) {
////            listMenu[indexPath.item].favorite = favorite
////        }
////    }
////
////    func updateQuantity(cell: CollectionViewCell, number: Int) {
//////        guard let indexPath = menuCollectionView.indexPath(for: cell) else { return }
////
////        if let indexPath = menuCollectionView.indexPath(for: cell) {
////            listMenu[indexPath.item].number = number
////        }
////
////    }
//}

extension HomeVC: FoodCollectionViewDelegate {
    func cell(cell: CollectionViewCell, _ action: CollectionViewCell.Action) {
        switch action {
        case .favorite(let isFavorite):
            if let indexPath = menuCollectionView.indexPath(for: cell) {
                listMenu[indexPath.item].favorite = isFavorite
            }

//            delegate.view(self, .reloadData)
            // Ban mot Notice relaod table view
        case .getNumber(let number):
            if let indexPath = menuCollectionView.indexPath(for: cell) {
               listMenu[indexPath.item].number = number
           }
        }
    }
}
