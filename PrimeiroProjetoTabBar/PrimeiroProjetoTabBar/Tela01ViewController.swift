//
//  ViewController.swift
//  PrimeiroProjetoTabBar
//
//  Created by Gabriel on 10/11/22.
//

import UIKit

class Tela01ViewController: UIViewController {
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var editFotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addNameButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var digiteNameLabel: UILabel!
    
    var array: [User] = []
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        personImageView.tintColor = .black
        nameTextField.delegate = self
        configImagePicker()
        personImageView.image = UIImage(systemName: "person.circle.fill")
    }
    
    
    func configImagePicker() {
        imagePicker.delegate = self
        
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        if textFieldIsNotEmpty() {
            array.append(User(name: nameTextField.text ?? "", image: personImageView.image ?? UIImage()))
            nameTextField.text = ""
            tableView.reloadData()
        } else {
            let alertController = UIAlertController(title: "Atenção", message: "Informe o nome corretamente", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(ok)
            present(alertController, animated: true)
        }
    }
    
    @IBAction func tappedEditPhotoButton(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        //        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        //            imagePicker.sourceType = .camera
        //        } else {
        
        //        }
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true)
    }
    
    
    func textFieldIsNotEmpty() -> Bool {
        if nameTextField.text?.isEmpty ?? true || nameTextField.text?.hasPrefix(" ") ?? true {
            return false
        } else {
            return true
        }
    }
    
}

extension Tela01ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.personImageView.image = image
        }
        picker.dismiss(animated: true)
    }
    
}

extension Tela01ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}

extension Tela01ViewController: UITableViewDelegate {
    
}

extension Tela01ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.setupCell(user: array[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 171
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        array.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}
