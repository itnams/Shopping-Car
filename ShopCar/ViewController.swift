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
        
        ref.child("tbXe").child("xe2").setValue(["id":2,"tenXe":"Ford F-series","anhXe":"FordF-series","giaXe":820000000,"chiTietXe":"Ford F-Series là dòng xe bán tải cỡ lớn (full-size pickup trucks) của nhà sản xuất ô tô Ford Motor, Mỹ. Ra đời từ năm 1948, đến nay F-Series đang ở thế hệ thứ 13 (2015-nay). Phiên bản phổ biến nhất của F-Series là F-150. Ngoài ra còn có xe tải Super 3-5 Class (F-250 đến F-550) và xe tải Super Duty 6-8 (F-650, F- 750)"])
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
    }
}

