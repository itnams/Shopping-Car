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
        if edtName.text! == "" || edtEmail.text! == "" || edtPhone.text! == "" {
            let alert:UIAlertController = UIAlertController(title: "Thông báo", message: "Vui long nhap đầy đủ thong tin", preferredStyle: UIAlertController.Style.alert)
            let btnCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive){ (btnCancel) in
            }
            alert.addAction(btnCancel)
            present(alert, animated: true, completion: nil)
        }else
        {
            let alert:UIAlertController = UIAlertController(title: "Thông báo", message: "Đăng ký thành công", preferredStyle: UIAlertController.Style.alert)
                      let btnCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive){ (btnCancel) in
                      }
                      alert.addAction(btnCancel)
                      present(alert, animated: true, completion: nil)
            edtName.text! = ""
            edtPhone.text! = ""
            edtEmail.text! = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblImageCar.image = UIImage(named: imageCar)
        lblModelCar.text! = modelCar
        lnlPriceCar.text! = priceCar
        // Do any additional setup after loading the view.
    }
  func kQ(mess:String)  {
         let alert:UIAlertController = UIAlertController(title: "Thông báo", message: mess, preferredStyle: .alert)
         let btnOK:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
         alert.addAction(btnOK)
         present(alert, animated: true, completion: nil)
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
