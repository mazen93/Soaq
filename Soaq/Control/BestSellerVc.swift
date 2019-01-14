//
//  BestSellerVc.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class BestSellerVc: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Brandscollection: UICollectionView!

    var array:[bestSellerModel]=[]
    var BrandsArray:[BrandsModel]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collection.delegate=self
        collection.dataSource=self
        
        Brandscollection.delegate=self
        Brandscollection.dataSource=self
    }
    
    func loadBrands() {
        let url="https://www.salonidepot.com/app/app.asmx/GetBrands?pageIndex=-1&userId=0&countryId=1&currencyId=1"
        
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
                            
                            let id = dataArr ["id"].int
                            let titleAr = dataArr ["TitleAR"].string
                            let titleEn = dataArr ["TitleEN"].string
                            let icon = dataArr ["Photo"].string
                            
                            
                            // create Ream Object
                            let item=BrandsModel(id: id, titleAR: titleAr, titleEn: titleEn, photo: icon)
                            
                            self.BrandsArray.append(item)
                        }
                        
                        //appending it to list
                        self.Brandscollection.reloadData()
                        
                    }
                    
                }
                
                
        }
    }

    func loadBestSelelr()  {
        let url="https://www.salonidepot.com/app/app.asmx/GetBrands?pageIndex=-1&userId=0&countryId=1&currencyId=1"
        
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
                            
                            let id = dataArr ["id"].int
                            let titleAr = dataArr ["TitleAR"].string
                            let titleEn = dataArr ["TitleEN"].string
                            let icon = dataArr ["Photo"].string
                            let finalPrice=dataArr ["Photo"].string
                            let currencyAr=dataArr ["CurrencyAR"].string
                            let currencyEn=dataArr ["CurrencyEN"].string
                            
                         
                            // create Ream Object
                            let item=bestSellerModel(id: id, titleAR: titleAr, titleEn: titleEn, photo: icon, final_price: finalPrice, currencyAr: currencyAr, currencyEn: currencyEn)
                            
                            self.collection.append(item)
                        }
                        
                        //appending it to list
                        self.Brandscollection.reloadData()
                        
                    }
                    
                }
                
                
        }
    }
}



extension BestSellerVc:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collection {
              return array.count
        }else{
            return BrandsArray.count
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection {
            

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as! BestSellerCell
            cell.setData(data: array[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCell", for: indexPath) as! BrandsCell
            cell.setData(data: BrandsArray[indexPath.row])
            return cell
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == collection{
            
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
        }
    }
    
    
}
