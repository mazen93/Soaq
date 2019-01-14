//
//  MainCategoryVC.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainCategoryVC: UIViewController{

    
    
    @IBOutlet weak var refresh: UIActivityIndicatorView!
    

     var array:[MainCategoryModel]=[]
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.delegate=self
        collection.dataSource=self
        loadData()
    
    }
    

    
    func loadData()  {
        
        refresh.startAnimating()
      
        let url="http://souq.hardtask.co/app/app.asmx/GetCategories?categoryId=0&countryId=1"
        
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
                            let item=MainCategoryModel(id: id!, titleAR: titleAr!, titleEn: titleEn!, photo: icon!, productCount: productCount!)
                            
                            self.array.append(item)
                        }
                        
                        //appending it to list
                        self.collection.reloadData()
                        
                    }
                    
                }
                
                
        }
        
    }


}
extension MainCategoryVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCell", for: indexPath) as! MainCategoryCell
        cell.setData(data: array[indexPath.row])
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      performSegue(withIdentifier: "go", sender: array[indexPath.row])
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go"{
        let destination=storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as? SubCategoryVC
            destination?.item=(sender as! MainCategoryModel)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

    
}
