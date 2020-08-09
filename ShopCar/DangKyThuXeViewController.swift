//
//  DangKyThuXeViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 8/2/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore

    var modelCar:String = ""
   var priceCar:String = ""
   var imageCar:String = ""
   

class DangKyThuXeViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var lblModelCar: UILabel!
    @IBOutlet weak var lblImageCar: UIImageView!
    @IBOutlet weak var lnlPriceCar: UILabel!
    
    @IBOutlet weak var lblDate: UIDatePicker!
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
            ref.child("tbThuXe").child(lblModelCar.text! + " " + edtPhone.text!).setValue(["date":lblDate.date.description,"model":self.lblModelCar.text!,"nameKH":self.edtName.text!,"phone":self.edtPhone.text!])
            let alert:UIAlertController = UIAlertController(title: "Thông báo", message: "Đăng ký thành công", preferredStyle: UIAlertController.Style.alert)
                      let btnCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive){ (btnCancel) in
                      }
                      alert.addAction(btnCancel)
                      present(alert, animated: true, completion: nil)
            edtName.text! = ""
            edtPhone.text! = ""
            edtEmail.text! = ""
        }
        //ref.child("tbThuXe").child(lblModelCar.text!).setValue("date":self.lblDate.text!,"model":self.lblModelCar.text!,"nameKH":self.edtName.text!,"phone":self.edtPhone.text!)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           let allowCharacters = "+1234567890"
           let allowedCharcterSet = CharacterSet(charactersIn: allowCharacters)
           let typedCharcter = CharacterSet(charactersIn: string)
           return allowedCharcterSet.isSuperset(of: typedCharcter)
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        edtPhone.delegate = self
        let url:URL = URL(string: imageCar )!
        do{
            let dulieu:Data = try Data(contentsOf: url)
            lblImageCar.image = UIImage(data: dulieu)
        }
        catch
        {
            
        }
       
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
