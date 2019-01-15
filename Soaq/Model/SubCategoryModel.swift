//
//  SubCategoryModel.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
class SubCategoryModel {
    var id:Int?
    var titleAR:String?
    var titleEn:String?
    var photo:String?
    
    var productCount:String?
    
    init(id:Int,titleAR:String,titleEn:String,photo:String,productCount:String) {
        self.id=id
        self.titleAR=titleAR
        self.titleEn=titleEn
        self.photo=photo
        self.productCount=productCount
    }

}
