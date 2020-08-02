//
//  HomeViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 7/29/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import Firebase
class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var lblTitle: UINavigationItem!
    @IBOutlet weak var tblView: UITableView!
    let arrTenSP:Array<String> = ["Toyota Corolla","Ford F-series","Toyota RAV4","Honda CR-V","Honda Civic","Toyota Camry","Ram pick-up","Toyota Hilux","Chevrolet Silverado","Volkswagen Tiguan"]
    let arrGia:Array<String> = ["10000000","820000000","642000000","1540000000","250000000","369000000","456000000","587000000","654000000","587000000"]
    let arrAnh:Array<String> = ["ToyotaCorolla","FordF-series","ToyotaRAV4","HondaCR-V","HondaCivic","ToyotaCamry","Rampick-up","ToyotaHilux","ChevroletSilverado","VolkswagenTiguan"]
    let arrCT:Array<String> = ["Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt.","Bán Xe Toyota Corolla 1.3L Vô cùng tiết kiệm xăng 6l/100km. Sản xuất 1999. Đăng ký tên tư nhân.Dòng xe của nhật bền bỉ.đề nhẹ nổ êm côn số ngọt.Thân vỏ đẹp.điều hòa mát, bốn kính điện, khóa cửa bấm thông minh, tay lái trợ lực, loa đài ngon, nội thất đẹp, mua về chỉ viẹc đổ xăng đi, xe gầm bệ chắc chắn.không mối mọt."]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTenSP.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.lblTenSP.text = arrTenSP[indexPath.row]
        cell.lblGiaSP.text = arrGia[indexPath.row] + " VND"
        cell.imgView.image = UIImage(named: arrAnh[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let manhinhdich:CTSPViewController = storyboard?.instantiateViewController(withIdentifier: "ctsp") as! CTSPViewController
        manhinhdich.name = arrAnh[indexPath.row];
        manhinhdich.giaXe = arrGia[indexPath.row];
        manhinhdich.ctsp = arrCT[indexPath.row];
        manhinhdich.tenxe = arrTenSP[indexPath.row];
        
        self.navigationController?.pushViewController(manhinhdich, animated: true)
        print(indexPath)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        lblTitle.title = "Shop car"
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
