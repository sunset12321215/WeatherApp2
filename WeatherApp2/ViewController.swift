//
//  ViewController.swift
//  WeatherApp2
//
//  Created by mac on 10/5/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import ObjectMapper


class ViewController: UIViewController {
    
    //  Dữ liệu

    var mang = [forecastday_child]()
    
    //  Ánh xạ
    
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_Localtime_epoch: UILabel!
    @IBOutlet weak var lbl_Localtime: UILabel!
    
    
    @IBOutlet weak var TableV: UITableView!
    
    
    //  Main
    override func viewDidLoad()
    {
        super.viewDidLoad()

    
    
        //  ---------   Làm việc với Json   ---------
        
        let link = "https://goo.gl/Fg1wJi"
        
        let url = URL(string: link)
        
        var jsonString = ""
        
        do{
            jsonString = try String.init(contentsOf: url!)
        }catch {    print("jsonString is Nil")    }
        
        let weather = Weather(JSONString: jsonString)
        
        guard
        let forecastday = weather?.forecast?.forecastday
            else {print("nil cmnr");return}
        
        for item in forecastday
        {
            mang.append(item)
        }
        

        
        //  ---------   Tải dữ liệu từ Json lên View phần Location   ---------
        
        let location = weather?.location
        
        lbl_Name.text = location?.name
        lbl_Localtime_epoch.text = String(describing: location?.localtime_epoch)
        lbl_Localtime.text = location?.localtime
        
        
        //  ---------   Table View   ---------
        
        
        TableV.dataSource = self
        TableV.delegate = self
        
        let nibName = UINib(nibName: "Custom_Cell", bundle: nil)
        TableV.register(nibName, forCellReuseIdentifier: "Cell")
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return mang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Custom_Cell
        

        guard let trangthai = mang[indexPath.row].day?.condition?.text
        else {
            print("Trạng thái 0 có dữ liệu");       return UITableViewCell()
        }
            
        guard let nhietdo = mang[indexPath.row].day?.avgtemp_c
            else {
            print("Nhiệt độ 0 có dữ liệu");       return UITableViewCell()
        }
            
        Cell.lbl_TrangThai.text = trangthai
        Cell.lbl_Temp.text      = String(format: "%1f", nhietdo)
            
        
        return Cell
    }
}
