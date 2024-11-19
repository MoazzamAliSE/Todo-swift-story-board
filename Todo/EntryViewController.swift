//
//  EntryViewController.swift
//  Todo
//
//  Created by Moazzam Ali on 17/11/2024.
//

import UIKit

class EntryViewController: UIViewController ,UITextFieldDelegate {
    @IBOutlet weak var taskTextField: UITextField!
    
    var update: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTextField.delegate = self
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(addTask))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        addTask()
        return true
    }
    @objc func addTask(_ sender: Any) {
        guard let text = taskTextField.text, !text.isEmpty else { return }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        
        UserDefaults().set(text, forKey: "tasks_\(newCount)")
        
        update?()
        navigationController?.popViewController(animated: true)
    }
}
 
