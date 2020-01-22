//
//  FirstViewController.swift
//  conteratest(ankita)
//
//  Created by Student P_08 on 18/10/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var tableview: UITableView!
    @IBAction func update(_ sender: UIButton) {
        let next = storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        navigationController?.pushViewController(next, animated: true)
    }
    var ScheduleArray = [String]()
    var ArrayDay = [String]()
    var ArrayTime = [String]()

    @IBAction func display(_ sender: UIButton) {
        let select = " select Schedule_name ,Time ,day from schedule;"
        
        let isSuccess = DBWrapper.sharedObj.slectALLTask(query: select)
        
        
        
}
    @IBOutlet weak var button1: UIButton!
    @IBAction func newscedule(_ sender: Any) {
        let next = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(next, animated: true)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

