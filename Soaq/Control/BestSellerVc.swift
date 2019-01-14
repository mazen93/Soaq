//
//  BestSellerVc.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

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
