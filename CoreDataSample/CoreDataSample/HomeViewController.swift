//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Murali Yarramsetti on 08/08/20.
//  Copyright © 2020 Murali Yarramsetti. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var studentTable : UITableView!
    var students = [Student]()
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Students"
        // Do any additional setup after loading the view.
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
        studentTable.delegate = self
        studentTable.dataSource = self
    }
    
    @objc func addTapped(){
        openAlertCheckUser()
    }
    
    
    func openAlertCheckUser() {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField {(textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField {(textField) in
            textField.placeholder = "email"
        }
       
        let action = UIAlertAction(title: "Add", style: .default){(_) in
            
            let name = alert.textFields?.first?.text
            let email = alert.textFields?.last?.text
            debugPrint(name ?? "")
            
            let newstudent = User(context:DBManager.sharedManager.context)
            newstudent.name = name
            newstudent.email = email
            DBManager.sharedManager.saveContext()
            self.users = DBManager.sharedManager.getUserObjects()
            self.studentTable.reloadData()
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func openAlert() {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField {(textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField {(textField) in
            textField.placeholder = "Age"
            textField.keyboardType = .numberPad
        }
        alert.addTextField {(textField) in
            textField.placeholder = "Rool number"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Add", style: .default){(_) in
            
            let name = alert.textFields?.first?.text
            let age = alert.textFields?.last?.text
            let rolenum = alert.textFields?.last?.text
            debugPrint(name ?? "")
            debugPrint(age ?? "")
            
            let newstudent = Student(context:DBManager.sharedManager.context)
            newstudent.name = name
            newstudent.age = Int16(age ?? "0") ?? 0
            newstudent.roolnumber = Int64(rolenum ?? "0") ?? 0
            DBManager.sharedManager.saveContext()
            self.students = DBManager.sharedManager.getStudentsObjects()
            self.studentTable.reloadData()
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = studentTable.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as?  StudentTableViewCell else
        {
            return UITableViewCell(frame: .zero)
        }
        let student = users[indexPath.row]
        cell.displaydata(student: student)
        return cell
    }
    
    
}
