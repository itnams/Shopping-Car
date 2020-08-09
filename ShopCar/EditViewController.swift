//
//  EditViewController.swift
//  ShopCar
//
//  Created by Nam Nguyen on 8/7/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase
var namehinh:String = ""
var model:String = ""
var price:String = ""
var detail:String = ""
class EditViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var lblDetail: UITextView!
    @IBOutlet weak var lblPrice: UITextField!
    @IBOutlet weak var lblModel: UITextField!
    
    @IBOutlet weak var imageEdit: UIImageView!
    
  
    private let storage = Storage.storage().reference()
    @IBAction func btnAdd(_ sender: Any) {

       
    }
    @IBAction func buttonADD(_ sender: Any) {
         let giaXe = Int(self.lblPrice.text!)
       
        self.storage.child(lblModel.text!).downloadURL(completion: {url,error in
                           guard let url = url , error ==  nil else {
                               return
                           }
                           let urlString = url.absoluteString
                           print("dowload url: \(urlString)")
                        
           
            ref.child("tbXe").child(self.lblModel.text!).setValue(["tenXe":self.lblModel.text!,"anhXe":urlString,"giaXe":giaXe,"chiTietXe":self.lblDetail.text!])
                       })
    }
    
    @IBAction func setImage(_ sender: UITapGestureRecognizer) {
    
        let picket = UIImagePickerController()
                picket.sourceType = .photoLibrary
                picket.delegate = self
                picket.allowsEditing = true
        present(picket, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else{
            return
        }
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
                      UIImage else{
                          fatalError("Can not read the image!")
                  }
               imageEdit.image = selectedImage
                  
        storage.child(self.lblModel.text!).putData(imageData, metadata: nil,completion: { _,error in
            guard error == nil else
            {
                 print("Failed to upload")
                return
            }
            self.storage.child(self.lblModel.text!).downloadURL(completion: {url,error in
                guard let url = url , error ==  nil else {
                    return
                }
                let urlString = url.absoluteString
                print("dowload url: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
        //upload image data
        //get download url to user
    }
    @IBAction func btnDelete(_ sender: Any) {
        ref.child("tbXe").child(self.lblModel.text!).removeValue()
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowCharacters = "1234567890"
        let allowedCharcterSet = CharacterSet(charactersIn: allowCharacters)
        let typedCharcter = CharacterSet(charactersIn: string)
        return allowedCharcterSet.isSuperset(of: typedCharcter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      lblModel.text! = model
      lblDetail.text! = detail
      lblPrice.text! = price
        lblPrice.delegate = self
      if(namehinh == "")
      {
          
      }
      else
      {
          let url:URL = URL(string: namehinh )!
                             do{
                                 let dulieu:Data = try Data(contentsOf: url)
                                 imageEdit.image = UIImage(data: dulieu)
                             }
                             catch
                             {
                                 
                             }
      }
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
