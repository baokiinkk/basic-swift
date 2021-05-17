//
//  TableViewCell.swift
//  tse
//
//  Created by Quoc Bao on 7/23/20.
//  Copyright © 2020 Quoc Bao. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var data = ""
    @IBOutlet weak var label: UILabel!
    weak var onclick:Click!
    @IBAction func button(_ sender: Any) {
        onclick.onClick(data)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        label.text = data
        // Configure the view for the selected state
    }
    func bind(_ str:String,_ onclick:Click){
        data = str;
        self.onclick = onclick
    }
    
}
protocol Click: class {
    func onClick(_ str:String)
}
