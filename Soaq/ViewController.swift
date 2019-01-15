//
//  ViewController.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var FullName: UITextField!
    @IBOutlet weak var codeTxt: UITextField!
    @IBOutlet weak var EmilTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var codebtn: UIButton!
    @IBOutlet weak var CountryBtn: UIButton!
    @IBOutlet weak var CityBtn: UIButton!
    @IBOutlet weak var AreaBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cn : String = Shared.shared.code ?? "Code"
        codebtn.setTitle(cn,for: .normal)
        //
        let cb : String = Sharedd.shareddd.country ?? "Country"
        CountryBtn.setTitle(cb,for: .normal)
        //
        let ci : String = Share.share.city ?? "City"
        CityBtn.setTitle(ci,for: .normal)
        //
        let Ar : String = Area.area.Areaa ?? "Area"
        AreaBtn.setTitle(Ar,for: .normal)
        

        self.FullName.delegate = self
         self.codeTxt.delegate = self
         self.passwordTxt.delegate = self
         self.EmilTxt.delegate = self
        // placeholder
        FullName.attributedPlaceholder = NSAttributedString(string: "Full Name",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        EmilTxt.attributedPlaceholder = NSAttributedString(string: "Email",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        // left padging text
        FullName.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: FullName.frame.height))
        FullName.leftViewMode = .always
        //
        passwordTxt.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: passwordTxt.frame.height))
        passwordTxt.leftViewMode = .always
        //
        codeTxt.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: codeTxt.frame.height))
        codeTxt.leftViewMode = .always
        
        EmilTxt.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: EmilTxt.frame.height))
        EmilTxt.leftViewMode = .always
        // button padging
        codebtn.titleEdgeInsets.top = 0
        codebtn.titleEdgeInsets.left = 10
        
        codebtn.titleEdgeInsets.bottom = 0
        codebtn.titleEdgeInsets.right = 0
        //
        CountryBtn.titleEdgeInsets.top = 0
        CountryBtn.titleEdgeInsets.left = 10
        
        CountryBtn.titleEdgeInsets.bottom = 0
        CountryBtn.titleEdgeInsets.right = 0
        //
        CityBtn.titleEdgeInsets.top = 0
        CityBtn.titleEdgeInsets.left = 10
        
        CityBtn.titleEdgeInsets.bottom = 0
        CityBtn.titleEdgeInsets.right = 0
        //
        AreaBtn.titleEdgeInsets.top = 0
        AreaBtn.titleEdgeInsets.left = 10
        
        AreaBtn.titleEdgeInsets.bottom = 0
        AreaBtn.titleEdgeInsets.right = 0
        
      
        
    }
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                self.view.endEditing(true)
        
            }
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
               FullName.resignFirstResponder()
               EmilTxt.resignFirstResponder()
                passwordTxt.resignFirstResponder()
                 codebtn.resignFirstResponder()
        
                return true
            }


}

