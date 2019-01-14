//
//  SubCategoryVC.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SubCategoryVC: UIViewController {

    
    
    var item:MainCategoryModel!
    var array:[SubCategoryModel]=[]
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var refresh: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        collection.delegate=self
        collection.dataSource=self
        loadData()
    }
    

    
    func loadData()  {
        
        refresh.startAnimating()
        
        let url="http://souq.hardtask.co/app/app.asmx/GetCategories?categoryId=1&countryId=1"
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error): break
                self.refresh.stopAnimating()
                    
                    
                case .success(let value):
                    
                    self.refresh.stopAnimating()
                    
                    let json = JSON(value)
                    print(json)
                    
                    if let dataArr = json.array
                    {
                        
                        
                        for dataArr in dataArr {
                            
                            let id = dataArr ["Id"].int
                            let titleAr = dataArr ["TitleAR"].string
                            let titleEn = dataArr ["TitleEN"].string
                            let icon = dataArr ["Photo"].string
                            let productCount=dataArr["ProductCount"].string
                            
                            // create Ream Object
                            let iteem=SubCategoryModel(id: id!, titleAR: titleAr!, titleEn: titleEn!, photo: icon!, productCount: productCount!)
                            
                            self.array.append(iteem)
                        }
                        
                        //appending it to list
                        self.collection.reloadData()
                        
                    }
                    
                }
                
                
        }
        
    }

}
extension SubCategoryVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCell", for: indexPath) as! SubCategoryCell
        cell.setData(data: array[indexPath.row])
        return cell
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
}
