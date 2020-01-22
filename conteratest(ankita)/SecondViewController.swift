//
//  SecondViewController.swift
//  conteratest(ankita)
//
//  Created by Student P_08 on 18/10/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var appliancesarray = ["light1","light2","light3","tv","ac","fan"]
   var RoomArrayData = ["Bedroom","Living room","Dining room","Kitchen"]
    @IBOutlet weak var appliancestableview: UITableView!
    @IBAction func appliancesaction(_ sender: Any) {
        if appliancestableview.isHidden == true
        {
            appliancestableview.isHidden = false
        }else{
            appliancestableview.isHidden = true
        }
        
    }
    
    @IBOutlet weak var roomtableview: UITableView!
    
    @IBAction func roomaction(_ sender: UIButton) {
        
        if roomtableview.isHidden == true
        {
            roomtableview.isHidden = false
        }
        else
        {
            roomtableview.isHidden = true
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == roomtableview
        {
            return RoomArrayData.count
        }
        else
        {
            return appliancesarray.count
        }
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == roomtableview
        {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = RoomArrayData[indexPath.row]
        return cell
        }
        else
        {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = appliancesarray[indexPath.row]
            return cell
 
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == roomtableview
        {
        let cell = tableView.cellForRow(at: indexPath)
        room.text = cell?.textLabel?.text!
        roomtableview.isHidden = true
        }else
        {
            let cell = tableView.cellForRow(at: indexPath)
            appliances.text = cell?.textLabel?.text!
            appliancestableview.isHidden = true

        }
    }
    @IBOutlet weak var appliances: UITextField!
    @IBOutlet weak var room: UITextField!
    @IBOutlet weak var scedulename: UITextField!
    override func viewDidLoad() {
        roomtableview.isHidden = true
        appliancestableview.isHidden = true
        pickerview.isHidden = true

        super.viewDidLoad()
        scedulename.layer.cornerRadius = 10
        room.layer.cornerRadius = 10
        appliances.layer.cornerRadius = 10


        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func timebutton(_ sender: UIButton) {
        if pickerview.isHidden == true
        {
            pickerview.isHidden = false
        }
        else
        {
            pickerview.isHidden = true
        }
    }
    @IBAction func picker(_ sender: UIDatePicker) {
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let currentTime = timeFormatter.string(from: pickerview
            .date)
        time.text = currentTime
        pickerview.isHidden = true
    }
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var pickerview: UIDatePicker!
   
    
    @IBOutlet weak var day: UILabel!
    
    @IBAction func monday(_ sender: UIButton) {
        day.text = "monday"
    }
    
    @IBAction func tuesday(_ sender: UIButton) {
        day.text = "tuesday"

    }
    
    @IBAction func wednesday(_ sender: UIButton) {
        day.text = "wednesday"

    }
    
    @IBAction func thursday(_ sender: UIButton) {
        day.text = "thursday"


    }
    
    @IBAction func friday(_ sender: UIButton) {
        day.text = "friday"

    }
    
    @IBAction func saturday(_ sender: UIButton) {
        day.text = "saturday"

    }
    
    @IBAction func sunday(_ sender: UIButton) {
        day.text = "sunday"

    }
    
    @IBAction func everyday(_ sender: UIButton) {
        day.text = "everyday"

    }
    
    
    
    @IBAction func insert(_ sender: UIButton) {
        let insert = "insert into Schedule((Schedule_Name, Room_Name, Appliance_Name,Time,day)values('\(scedulename.text)','\(room.text)','\(appliances.text)','\(time.text)','\(day.text)'))"
        let isSuccess = DBWrapper.sharedObj.excuteQuery(query: insert)
        if isSuccess
        {
            print("Insert:Successfully....")
            
        }
        else
        {
            print("Failed")
        }
        
        
        

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

