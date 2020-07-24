//
//  ViewController.swift
//  IOS
//
//  Created by Nam Nguyen on 7/23/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var btnMenu:UIButton = UIButton()
    var viewMenu:UIView = UIView()
    func setupViewMenu(){
        viewMenu = UIView(frame: CGRect(x: -view.frame.width / 2, y: 20 + (navigationController?.navigationBar.frame.height)!, width: view.frame.width / 2, height: view.frame.height - 20 + (navigationController?.navigationBar.frame.height)!))
        navigationController?.view.addSubview(viewMenu)
        viewMenu.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    func setButton(){//Khoi tao navagition
             btnMenu = UIButton(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        btnMenu.setBackgroundImage(UIImage(named: "Menu"), for: .normal)
             navigationController?.navigationBar.addSubview(btnMenu)
        btnMenu.addTarget(self, action: #selector(ViewController.showMenu), for: .touchUpInside)
         }
    @objc func showMenu()  {
        if(viewMenu.frame.origin.x < 0 )
        {
            UIView.animate(withDuration: 0.5)
            {
                self.viewMenu.frame.origin.x += self.view.frame.width / 2
            }
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations:{
                self.viewMenu.frame.origin.x -= self.view.frame.width / 2
            })
        }
        print("Menu")
        
    }
    @IBOutlet weak var homeView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCar[section].count // so xe cua hang do
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrTheFirm.count //so hang xe
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrTheFirm[0]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:imageCarTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! imageCarTableViewCell
        cell.tblTitle.text = arrCar[indexPath.section][indexPath.row]
        cell.imgView.image = UIImage(named: arrCarImage[indexPath.section][indexPath.row])
        return cell
    }
    let arrCar:Array<Array<String>> = [["Vinfast Lux A2.0","Vinfast Lux SA2.0","Vinfast Lux V8"],["Kia Cerato (K3)","Kia Optima (K5)","Kia Quoris (K9)","Kia Rondo","Kia Seltos"],["ROLLS ROYCE PHANTOM","ROLLS ROYCE PHANTOM COUPE/DROPHEAD COUPE"],["MG ZS","MG3"]]// ten xe
    let arrCarImage:Array<Array<String>> = [["vinfast","vinfast","vinfast"],["kia","kia","kia","kia","kia"],["logorollsroyce","logorollsroyce"],["mg","mg"]]//anh cua xe
    let arrTheFirm:Array<String> = ["Vinfast","Kia","ROLLS ROYCE","MG"]// Hang xe
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setupViewMenu()
        homeView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
