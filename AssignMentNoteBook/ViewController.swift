//
//  ViewController.swift
//  AssignMentNoteBook
//
//  Created by Michael Linker on 2/25/19.
//  Copyright © 2019 Michael Linker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var assignments: [Assignment] = []
    var assignment1 = Assignment(name: "Math", note: "pages 101 - 123")
    var assignment2 = Assignment(name: "Bio reading", note: "reading textbook")
    var assignment3 = Assignment(name: "Assignment Notebook", note: "Due Monday")
    var tmpName = ""
    var tmpDescription = ""
    @IBOutlet weak var myTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignments.append(assignment1)
        assignments.append(assignment2)
        assignments.append(assignment3)
        myTableview.dataSource = self
    }

    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var TEMPITEM = Assignment(name: tmpName, note: tmpDescription)
        let alert = UIAlertController.init(title: "New Item", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter Name Of Item"
        })
        alert.addTextField { (TextField) in
            TextField.placeholder = "Optional Note"
        }
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
            let textFieldName = alert?.textFields![0].text
            let textFieldNote = alert?.textFields![1]
            if let tmpname = textFieldName {
                TEMPITEM.name = tmpname
                if let tmpnote = textFieldNote?.text {
                    TEMPITEM.note = tmpnote
                }
            }
            self.assignments.append(TEMPITEM)
            self.myTableview.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let currentAssignment = assignments[indexPath.row]
            cell.textLabel?.text = currentAssignment.name
            cell.detailTextLabel?.text = currentAssignment.note
            return cell
        }else {
            return UITableViewCell()
        }
    }
}

