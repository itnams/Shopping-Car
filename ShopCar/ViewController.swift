//
//  ViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 7/28/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController {

    @IBAction func btnDangKy(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "manhinhDangKy") as! DangKyViewController
        present(scr,animated: true,completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var hinhnen:UIImage	= UIImage(named: "Anhnen.jpg")!
        self.view.backgroundColor = UIColor(patternImage: hinhnen)
        let ref = Database.database().reference()
        ref.observe(DataEventType.value, with: {(data) in print(data)})
        ref.child("tbXe").child("xe2").setValue(["id":2,"tenXe":"Ford F-series","anhXe":"FordF-series","giaXe":820000000,"chiTietXe":"Ford F-Series là dòng xe bán tải cỡ lớn (full-size pickup trucks) của nhà sản xuất ô tô Ford Motor, Mỹ. Ra đời từ năm 1948, đến nay F-Series đang ở thế hệ thứ 13 (2015-nay). Phiên bản phổ biến nhất của F-Series là F-150. Ngoài ra còn có xe tải Super 3-5 Class (F-250 đến F-550) và xe tải Super Duty 6-8 (F-650, F- 750)"])
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let alert:UIAlertController = UIAlertController(title: "Login", message: "Vui long nhap thong tin", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (txtEmail) in
            txtEmail.placeholder = " ✉︎ Nhap Email"
        }
        alert.addTextField{ (txtPass) in
            txtPass.placeholder = "🗝 Nhap pass"
            txtPass.isSecureTextEntry = true
        }
        let btnLogin:UIAlertAction = UIAlertAction(title: "Login", style: .destructive) { (btnLogin) in
            let email:String = alert.textFields![0].text!
            let pass:String = alert.textFields![1].text!
            if email == "admin" && pass == "admin"
            {
                self.kQ(mess: "Dang nhap thanh cong")
            }
            else
            {
                self.kQ(mess: "Dang nhap that bai")
            }
        }
        let btnCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive){ (btnCancel) in
        }
        let btnkhach:UIAlertAction = UIAlertAction(title: "Customer", style: .destructive) { (btnKhach) in
        }
        alert.addAction(btnLogin)
        alert.addAction(btnCancel)
        alert.addAction(btnkhach)
        present(alert, animated: true, completion: nil)
        
        
    }
    func kQ(mess:String)  {
        let alert:UIAlertController = UIAlertController(title: "Thông báo", message: mess, preferredStyle: .alert)
        let btnOK:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
    }
}

