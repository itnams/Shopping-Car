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
    @IBOutlet weak var imgView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView2.image = UIImage(named: name)
        
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
