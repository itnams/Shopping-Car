//
//  AdminViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 8/2/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var lblUser: UITextField!
    @IBOutlet weak var lblPass: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        
        if lblUser.text! == "Admin" && lblPass.text! == "Admin" {
           let scr = storyboard?.instantiateViewController(withIdentifier: "manager") as! ManagerViewController
           present(scr, animated: true, completion: nil)
        }
        else
        {
            let alert:UIAlertController = UIAlertController(title: "Thông báo", message: "Đăng nhập thất bại", preferredStyle: UIAlertController.Style.alert)
                       let btnCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive){ (btnCancel) in
                       }
                       alert.addAction(btnCancel)
                       present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
