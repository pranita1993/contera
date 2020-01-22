//
//  database.swift
//  conteratest(ankita)
//
//  Created by Student P_08 on 18/10/19.
//  Copyright © 2019 felix. All rights reserved.
//

import Foundation
class DBWrapper
{
    static let sharedObj = DBWrapper()
    var scheduleArrayData = [String]()
    var RoomScheduleArray = [String]()
    var DayScheduleArray = [String]()
    var TimeScheduleArray = [String]()
    var ApplianceScehduleArray = [String]()
    
    func getDataBasePath()-> String
    {
        let dir  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path  = dir.first!
        return path+"/myDatabase.sqlite"
    }
    
    //SELECT QUERY
    
    func slectALLTask(query: String)
    {
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        scheduleArrayData = [String]()
        RoomScheduleArray = [String]()
        DayScheduleArray = [String]()
        TimeScheduleArray = [String]()
        ApplianceScehduleArray = [String]()
        
        let dbPath = getDataBasePath()
        if(sqlite3_open(dbPath, &dB) == SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil) == SQLITE_OK)
            {
                while (sqlite3_step(stmt!) == SQLITE_ROW)
                {
                    let sdn = sqlite3_column_text(stmt!, 0)
                    let Schedule_Name = String(cString: sdn!)
                    let rn = sqlite3_column_text(stmt!, 1)
                    let Room_Name = String(cString: rn!)
                    let apn = sqlite3_column_text(stmt!, 2)
                    let Appliance_Name = String(cString: apn!)
                    let tm  = sqlite3_column_text(stmt!, 3)
                    let times = String(cString: tm!)
                    let dy = sqlite3_column_text(stmt!, 4)
                    let day = String(cString: dy!)
                    
                    scheduleArrayData.append(Schedule_Name)
                    RoomScheduleArray.append(Room_Name)
                    ApplianceScehduleArray.append(Appliance_Name)
                    TimeScheduleArray.append(times)
                    DayScheduleArray.append(day)
                    
                }
            }
            else
            {
                print("Error in prepare statement:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening database:\(sqlite3_errmsg(stmt!))")
        }
    }
    
    func excuteQuery(query:String)->Bool
    {
        var sucess:Bool = true
        var db:OpaquePointer?
        var stmt:OpaquePointer?
        let dbpath = getDataBasePath()
        if (sqlite3_open(dbpath,&db) == SQLITE_OK)
        {
            if (sqlite3_prepare_v2(db!, query, -1, &stmt, nil) == SQLITE_OK)
            {
                if (sqlite3_step(stmt!) == SQLITE_DONE)
                {
                    sucess = true
                }
                else{
                    print("error is step:\(sqlite3_errmsg(stmt!))")
                }
            }
            else{ print("error is prepare:\(sqlite3_errmsg(stmt))")
            }
        }
            
        else{
            print("error in open:\(sqlite3_errmsg(stmt!))")
        }
        return sucess
        
        
    }

    func createtable()
    {
        let create = "create table if not exists Schedule(Schedule_Name text, Room_Name text, Appliance_Name text,Time text,Day text)"
        let isSuccess = excuteQuery(query: create)
        if isSuccess
        {
            print("table creation:success")
        }
    }
    
}






