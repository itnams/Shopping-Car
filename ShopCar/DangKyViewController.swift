//
//  DangKyViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 7/31/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import FirebaseDatabase
 let ref = Database.database().reference()
class DangKyViewController: UIViewController {

    var id:Int = 0
    var quyen:String = "Admin"
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassWord: UITextField!
    
    @IBOutlet weak var segmentedPosition: UISegmentedControl!
    
   
    @IBAction func btnRegistration(_ sender: Any) {
        let useft = UserDefaults()
        useft.set( id, forKey: "id")
        if let idu = useft.object(forKey: "id") as? Int{
            id = idu
        }; ref.child("tbUser").child(id.description).setValue(["userName":txtUserName.text!,"pass":txtPassWord.text!,"quyen":quyen])
        id += 1
        
    }
    
    @IBAction func segmented(_ sender: Any) {
        let segIndex = segmentedPosition.selectedSegmentIndex
        let segTitle = segmentedPosition.titleForSegment(at: segIndex)
        switch segIndex {
        case 0:
            quyen = "Admin"
        default:
            quyen = "Customer"
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
