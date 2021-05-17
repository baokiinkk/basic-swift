//
//  SecondViewController.swift
//  tse
//
//  Created by Quoc Bao on 7/22/20.
//  Copyright © 2020 Quoc Bao. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var str:String!
    var dataCell = ["Van A", "Van B", "Van C", "Van D"]
    weak var data:DataDelegate!
    @IBOutlet weak var text: UILabel!
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        data.hamTraVe("tra ve")
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = str
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "item")
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(edit))
        // Do any additional setup after loading the view.
    }
    @objc func edit() {
        tableView.isEditing.toggle()
    }

}
extension SecondViewController: UITableViewDataSource,UITableViewDelegate,Click{
    func onClick(_ str: String) {
        text.text = str
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! TableViewCell
        cell.bind(dataCell[indexPath.row],self)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            dataCell.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
protocol DataDelegate: class {
    func hamTraVe(_ str: String) 
}
