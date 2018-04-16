//
//  ViewController.swift
//  StudentMnager
//
//  Created by Huy on 4/10/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class DetailVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var btnD: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        if Datasevicer.shared.indexPath != nil {
        //            txtName.text = Datasevicer.shared.array[index!].name
        //            imageV.image = Datasevicer.shared.array[index!].image as? UIImage
        //
        //        }
        if let indexPath = Datasevicer.shared.indexPath {
            let student = Datasevicer.shared.fetchedResultsController.object(at: indexPath)
            txtName.text = student.name
            imageV.image = student.image as? UIImage
        } else{
            btnD.isHidden = true

        }
    }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        if let indexPath = Datasevicer.shared.indexPath {
         Datasevicer.shared.array[indexPath.row].image = imageV.image
         Datasevicer.shared.array[indexPath.row].name = txtName.text
         AppDelegate.saveContext()
        }
        else{
        let entity = Entity(context: AppDelegate.context)
        entity.image = imageV.image
        entity.name = txtName.text
        AppDelegate.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapSelectPhoto(_ sender: UITapGestureRecognizer) {
        
        let selectImage = UIImagePickerController()
        selectImage.sourceType = .photoLibrary
        selectImage.delegate = self
        present(selectImage, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageV.image = image
        dismiss(animated: true, completion: nil)
    }
    @IBAction func deleteBtn(_ sender: UIButton) {
        
        if let indexPath = Datasevicer.shared.indexPath {
       AppDelegate.context.delete(Datasevicer.shared.fetchedResultsController.object(at: indexPath))
            navigationController?.popViewController(animated: true)
        }
        else{
        }

        
    }
    
    
    
    
    
    
}

