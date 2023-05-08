//
//  ViewController.swift
//  FinanceUI
//
//  Created by Фараби Иса on 09.05.2023.
//

import UIKit

class ViewController: UIViewController {

    let header: UILabel = {
        let label = UILabel()
        label.text = "Баланс"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balance: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let month: UILabel = {
        let label = UILabel()
        label.text = "Апрель 2020"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let leftButton: UIButton = {
        let image = UIButton()
        image.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let rightButton: UIButton = {
        let image = UIButton()
        image.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let alsoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cм. еще", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = UIColor(red: 0xf1, green: 0xf1, blue: 0xf1)
        
        setupTabBarController()
        view.addSubview(header)
        view.addSubview(balance)
        view.addSubview(month)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(background)
        background.addSubview(alsoButton)
    }
    
    func setupTabBarController() {
        let tabBarController = UITabBarController()
        
        let firstViewController = UIViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "circle.righthalf.filled"), tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Отчёты", image: UIImage(systemName: "line.3.horizontal.decrease"), tag: 1)
        
        let thirdViewController = UIViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 2)
        
        tabBarController.viewControllers = [firstViewController, secondViewController, thirdViewController]
        
        let tabBar = tabBarController.tabBar
        tabBar.tintColor = .systemYellow
        
        let topDividerView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        topDividerView.backgroundColor = .lightGray
        tabBar.addSubview(topDividerView)
        
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
        
        tabBarController.delegate = self
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            balance.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            balance.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            month.topAnchor.constraint(equalTo: balance.bottomAnchor, constant: 30),
            month.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftButton.topAnchor.constraint(equalTo: balance.bottomAnchor, constant: 30),
            leftButton.trailingAnchor.constraint(equalTo: month.leadingAnchor, constant: -70),
            
            rightButton.topAnchor.constraint(equalTo: balance.bottomAnchor, constant: 30),
            rightButton.leadingAnchor.constraint(equalTo: month.trailingAnchor, constant: 70),
            
            background.topAnchor.constraint(equalTo: month.bottomAnchor, constant: 20),
            background.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            background.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            background.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            
            alsoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alsoButton.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -20)
        ])
    }
}

extension ViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        tabBarController.tabBar.tintColor = .systemYellow
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
