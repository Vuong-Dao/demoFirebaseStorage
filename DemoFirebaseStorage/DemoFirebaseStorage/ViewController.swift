//
//  ViewController.swift
//  DemoFirebaseStorage
//
//  Created by VuongDao on 3/4/18.
//  Copyright © 2018 VuongDao. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController {
    
    var storage : Storage?
    var storageRef : StorageReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        storage = Storage.storage()
        storageRef = storage!.reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSelectImageAction(_ sender: Any) {
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.sourceType = .photoLibrary
        self.present(imagepicker, animated: true, completion: nil)
    }
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var source:String!
        var imageData: Data?
        
        source = UIImagePickerControllerOriginalImage
        if let image = info[source] as? UIImage {
            imageData = Helpers.scaleImage(image: image)
            let riversRef = storageRef?.child("images/rivers.jpg")
            let uploadTask = riversRef?.putData(imageData!, metadata: nil, completion: { (response, error) in
                if let tt = response?.downloadURL() {
                    print(tt.absoluteString)
                } else {
                    print(error.debugDescription)
                }
            })
        }
        self.dismiss(animated: true, completion: nil)
    }
}

