//
//  BestSellerModel.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
class bestSellerModel {
    var id:Int=0
    var titleAR:String=""
    var titleEn:String=""
    var photo:String=""
    var final_price:String=""
    var currencyAr:String=""
    var currencyEn:String=""
    
    init(id:Int,titleAR:String,titleEn:String,photo:String,final_price:String,currencyAr:String,currencyEn:String) {
        self.id=id
        self.titleAR=titleAR
        self.titleEn=titleEn
        self.photo=photo
        self.final_price=final_price
        self.currencyAr=currencyAr
        self.currencyEn=currencyEn
    }
}
