//
//  TinTucXeOToViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 8/2/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class TinTucXeOToViewController: UIViewController {

    @IBOutlet weak var thongtinOTO: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url:URL = URL(string: "https://autodaily.vn/")!
        let req:URLRequest = URLRequest(url: url)
        thongtinOTO.loadRequest(req)
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
