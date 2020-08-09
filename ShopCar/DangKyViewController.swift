//
//  DangKyViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 7/31/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import Firebase
 let ref = Database.database().reference()
class DangKyViewController: UIViewController {

    var id:Int = 0
    var quyen:String = "Admin"
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassWord: UITextField!
    
    @IBOutlet weak var segmentedPosition: UISegmentedControl!
    
   
    @IBAction func btnRegistration(_ sender: Any) {
              Auth.auth().createUser(withEmail: txtUserName.text!, password: txtPassWord.text!) { authResult, error in
                 // ...
                   if error == nil
                   {
                    let alert:UIAlertController = UIAlertController(title: "Thông báo", message: "Đăng ký thành công", preferredStyle: UIAlertController.Style.alert)
                                        let btnCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive){ (btnCancel) in
                                        }
                                        alert.addAction(btnCancel)
                    self.present(alert, animated: true, completion: nil)
                   }
                   else
                   {
                    let alert:UIAlertController = UIAlertController(title: "Thông báo", message: error.debugDescription, preferredStyle: UIAlertController.Style.alert)
                                    let btnCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive){ (btnCancel) in
                                    }
                                    alert.addAction(btnCancel)
                self.present(alert, animated: true, completion: nil)
                   }
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
