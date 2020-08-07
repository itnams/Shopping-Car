//
//  HomeViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 7/29/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import Firebase
import FirebaseCoreDiagnostics

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrCar:Array<Car> = Array<Car>()
     // Listen for deleted comments in the Firebase database
    @IBOutlet weak var lblTitle: UINavigationItem!
    @IBOutlet weak var tblView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCar.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.lblTenSP.text = arrCar[indexPath.row].model
        cell.lblGiaSP.text = String(arrCar[indexPath.row].price) + " VND"
        cell.imgView.image = UIImage(named: arrCar[indexPath.row].image)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let manhinhdich:CTSPViewController = storyboard?.instantiateViewController(withIdentifier: "ctsp") as! CTSPViewController
        manhinhdich.name = arrCar[indexPath.row].image;
        manhinhdich.giaXe = String(arrCar[indexPath.row].price);
        manhinhdich.ctsp = arrCar[indexPath.row].detail;
        manhinhdich.tenxe = arrCar[indexPath.row].model;
        self.navigationController?.pushViewController(manhinhdich, animated: true)
        print(indexPath)
    }
    struct Car {
        var model:String
        var image:String
        var price:Int
        var detail:String
        init(data:AnyObject) {
            let dulieu = data as! Dictionary<String,AnyObject>
            price = dulieu["giaXe"] as! Int
            model = dulieu["tenXe"] as! String
            image = dulieu["anhXe"] as! String
            detail = dulieu["chiTietXe"] as! String
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        lblTitle.title = "Shop car"
        ref.child("tbXe").observe(DataEventType.value, with: {(data) in if let postDict = data.value as? [String:AnyObject]
        {
            self.arrCar.removeAll()
            for i in postDict
            {
                print(i.key)
                self.arrCar.append(Car(data: i.value))
                self.tblView.reloadData()
            }
            }
        })
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
