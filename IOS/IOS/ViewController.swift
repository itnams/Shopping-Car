//
//  ViewController.swift
//  IOS
//
//  Created by Nam Nguyen on 7/23/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var homeView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCar[section].count // so xe cua hang do
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrTheFirm.count //so hang xe
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrTheFirm[0]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = arrCar[indexPath.section][indexPath.row]
        return cell!
    }
    let arrCar:Array<Array<String>> = [["Vinfast Lux A2.0","Vinfast Lux SA2.0","Vinfast Lux V8"],["Kia Cerato (K3)","Kia Optima (K5)","Kia Quoris (K9)","Kia Rondo","Kia Seltos"],["ROLLS ROYCE PHANTOM","ROLLS ROYCE PHANTOM COUPE/DROPHEAD COUPE"],["MG ZS","MG3"]]// ten xe
    let arrTheFirm:Array<String> = ["Vinfast","Kia","ROLLS ROYCE","MG"]// Hang xe
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

