//
//  MainCategoryModel.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
class MainCategoryModel {

    var id:Int=0
    var titleAR:String=""
    var titleEn:String=""
    var photo:String=""

    
    init(id:Int,titleAR:String,titleEn:String,photo:String) {
        self.id=id
        self.titleAR=titleAR
        self.titleEn=titleEn
        self.photo=photo
    }

    
}
