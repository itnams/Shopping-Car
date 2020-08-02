//
//  DangKyThuXeViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 8/2/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
    var modelCar:String = ""
   var priceCar:String = ""
   var imageCar:String = ""
   

class DangKyThuXeViewController: UIViewController {
   
    @IBOutlet weak var lblModelCar: UILabel!
    @IBOutlet weak var lblImageCar: UIImageView!
    @IBOutlet weak var lnlPriceCar: UILabel!
    
    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var edtPhone: UITextField!
    @IBOutlet weak var edtEmail: UITextField!
    var thongbao:UIAlertController?
    
    @IBAction func btnDK(_ sender: Any) {
        if edtName.text! == nil || edtEmail.text! == nil || edtPhone.text! == nil {
            thongbao = UIAlertController(title: "Canh bao", message: "Vui lòng nhập đủ thông  ", preferredStyle: .alert)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblImageCar.image = UIImage(named: imageCar)
        lblModelCar.text! = modelCar
        lnlPriceCar.text! = priceCar
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
