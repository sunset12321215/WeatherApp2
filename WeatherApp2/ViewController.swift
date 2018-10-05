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
    
    
    let mang = ["Thứ 2","Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7" , "CN"]
    
    //  Ánh xạ
    
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_Localtime_epoch: UILabel!
    @IBOutlet weak var lbl_Localtime: UILabel!
    
    
    @IBOutlet weak var TableV: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        TableV.dataSource = self
        TableV.delegate = self
    
    
        //  ---------   Làm việc với Json   ---------
        
        let link = "https://goo.gl/Fg1wJi"
        
        let url = URL(string: link)
        
        var jsonString = ""
        
        do{
            jsonString = try String.init(contentsOf: url!)
        }catch {    print("jsonString is Nil")    }
        
        let weather = Weather(JSONString: jsonString)
        
        
        
        //  ---------   Tải dữ liệu từ Json lên View phần Location   ---------
        
        let location = weather?.location
        
        lbl_Name.text = location?.name
        lbl_Localtime_epoch.text = String(describing: location?.localtime_epoch)
        lbl_Localtime.text = location?.localtime
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        Cell?.textLabel?.text = mang[indexPath.row]
        
        return Cell!
    }
    
    
}
