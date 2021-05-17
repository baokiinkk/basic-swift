//
//  FirstViewControlerViewController.swift
//  tse
//
//  Created by Quoc Bao on 7/22/20.
//  Copyright © 2020 Quoc Bao. All rights reserved.
//

import UIKit

class FirstViewControlerViewController: UIViewController {

    @IBAction func next(_ sender: Any) {
        let nextSecond = SecondViewController()
        nextSecond.str = "pass"
        nextSecond.data = self
        navigationController?.pushViewController(nextSecond, animated: true)
    }
    @IBOutlet weak var text: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

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
extension FirstViewControlerViewController:DataDelegate{
    func hamTraVe(_ str: String) {
        text.text = str
    }
    
    
}
