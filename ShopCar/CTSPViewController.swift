//
//  CTSPViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 7/29/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class CTSPViewController: UIViewController {
    var name: String = ""
    var tenxe: String = ""
    var giaXe: String = ""
    var ctsp:String = ""
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var lblTenXe: UILabel!
    @IBOutlet weak var lblGiaXe: UILabel!
    @IBOutlet weak var lblCTSP: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var hinhnen:UIImage    = UIImage(named: "Anhnen.jpg")!
        self.view.backgroundColor = UIColor(patternImage: hinhnen)
        imgView2.image = UIImage(named: name)
        lblTenXe.text! = tenxe
        lblGiaXe.text! = giaXe + " VND"
        lblCTSP.text! = ctsp
        // Do any additional setup after loading the view.
    }
    @IBAction func btnTryOnCar(_ sender: Any) {
        imageCar = name
        modelCar = tenxe
        priceCar = giaXe
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
