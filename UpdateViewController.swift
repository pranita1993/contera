//
//  UpdateViewController.swift
//  conteratest(ankita)
//
//  Created by Student P_08 on 03/12/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var appliancesarray = ["light1","light2","light3","tv","ac","fan"]
    var RoomArrayData = ["Bedroom","Living room","Dining room","Kitchen"]
    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var roomname: UITextField!
    @IBAction func roomA(_ sender: UIButton) {
        if roomT.isHidden == true
        {
            roomT.isHidden = false
        }
        else
        {
            roomT.isHidden = true
        }
    }
    
    @IBOutlet weak var roomT: UITableView!
    
    
    @IBOutlet weak var appliancename: UITextField!
    
    @IBAction func applianceA(_ sender: UIButton) {
        if applianceT.isHidden == true
        {
        applianceT.isHidden = false
        }else{
            applianceT.isHidden = true
        }
        
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == roomT
        {
            return RoomArrayData.count
        }
        else
        {
            return appliancesarray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == roomT
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
        if tableView == roomT
        {
            let cell = tableView.cellForRow(at: indexPath)
            roomname.text = cell?.textLabel?.text!
            roomT.isHidden = true
        }else
        {
            let cell = tableView.cellForRow(at: indexPath)
            appliancename.text = cell?.textLabel?.text!
            applianceT.isHidden = true
            
        }
    }

    
    @IBOutlet weak var applianceT: UITableView!
    
    @IBAction func timeA(_ sender: UIButton) {
        if dateP.isHidden == true
        {
            dateP.isHidden = false
        }
        else
        {
            dateP.isHidden = true
        }
    }
    @IBOutlet weak var time: UITextField!
    
    @IBOutlet weak var pickerT: UIPickerView!
    
    @IBOutlet weak var dateP: UIDatePicker!
    @IBAction func datepicker(_ sender: UIDatePicker) {
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let currentTime = timeFormatter.string(from: dateP
            .date)
        time.text = currentTime
        dateP.isHidden = true

    }
    
    @IBAction func update(_ sender: UIButton) {
        let update = "update schedule set (Schedule_Name ='\(name.text)',Room_Name = '\(roomname.text)',Appliance_Name = '\(appliancename.text)','Time = '\(time.text)' where Schedule_name = '\(name.text)'"
        let isSuccess = DBWrapper.sharedObj.excuteQuery(query: update)
        if isSuccess
        {
            print("update:Successfully....")
            
        }
        else
        {
            print("Failed")
        }

        
    }
    
    @IBAction func data(_ sender: UIButton) {
    }
    
    @IBAction func itemD(_ sender: UIButton) {
        let delete = " delete from schedule where Schedule_name = '\(name.text)';"
        let isSuccess = DBWrapper.sharedObj.excuteQuery(query: delete)
        if isSuccess
        {
            print("delete:Successfully....")
            
        }
        else
        {
            print("Failed")
        }

        
    }
   
       override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
