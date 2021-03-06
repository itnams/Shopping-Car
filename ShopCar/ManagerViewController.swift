//
//  ManagerViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 8/7/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import Firebase
class ManagerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
var arrCar:Array<Car> = Array<Car>()
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCar.count
    }
    @IBAction func btnAdd(_ sender: Any) {
        price =  ""
        model = ""
        namehinh = ""
        detail = ""
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:managerofAdminTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! managerofAdminTableViewCell
        cell.lblTenSP.text = arrCar[indexPath.row].model
        cell.lblGia.text = String(arrCar[indexPath.row].price)
        let url:URL = URL(string: arrCar[indexPath.row].image )!
              do{
                  let dulieu:Data = try Data(contentsOf: url)
                   cell.imageView?.image = UIImage(data: dulieu)
              }
              catch
              {
                  
              }
        return cell
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
    @IBOutlet weak var tblView: UITableView!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
       
        model = arrCar[indexPath.row].model
        detail = arrCar[indexPath.row].detail
        price = String(arrCar[indexPath.row].price)
       namehinh = arrCar[indexPath.row].image
        let src = storyboard?.instantiateViewController(withIdentifier: "manhinhedit") as! EditViewController
        present(src,animated: true,completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
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
