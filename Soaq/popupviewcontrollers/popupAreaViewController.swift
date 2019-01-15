//
//  popupAreaViewController.swift
//  Soaq
//
//  Created by tr on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class popupAreaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

   
    @IBOutlet weak var Popupview: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
     var Area:[AreaModel]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Apply radius to Popupview
        Popupview.layer.cornerRadius = 10
        Popupview.layer.masksToBounds = true
        
    }
    func loadData()  {
        
        
        var url:String="http://www.salonidepot.com/app/app.asmx/GetCountries"
        
        
        //let cn=Bundle.main.preferredLocalizations.first!
        
        
        
        
        
        
        
        
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                // self.activityIndicator.stopAnimating()
                switch response.result
                {
                case .failure(let error): break
                    
                    
                case .success(let value):
                    
                    
                    let json = JSON(value)
                    print(json)
                    
                    if let dataArr = json["TitleEN"].array
                    {
                        
                        //                        for dataArr in dataArr {
                        //
                        //
                        //                         //   let id = dataArr ["category_s_ID"].string
                        //                            let title = dataArr ["TitleEN"].string
                        //                           // let icon = dataArr ["secCategory_icon"].string
                        //                            let user=HomeModel(title: title!)
                        //                            self.userList.append(user)
                        //                        }
                        
                        //appending it to list
                        self.reloadData()
                        
                    }
                    
                }
                
                
        }
        
    }
    
    func reloadData()  {
        self.tableView.reloadData()
    }
    
    
    
    // Returns count of items in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Area.count;
    }
    
    
    // Select item from tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("City : " + Area[indexPath.row])
        
       Area.area.Areaa = Area[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    //Assign values for tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = Area[indexPath.row]
        
        return cell
    }
    
    // Close PopUp
    @IBAction func closePopup(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
