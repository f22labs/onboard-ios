//
//  ViewController.swift
//  onboarding
//
//  Created by ranjithatF22Labs on 11/07/2016.
//  Copyright (c) 2016 ranjithatF22Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController,onBoardingViewProtocol {

    var myView: OnBoardingView! { return self.view as! OnBoardingView }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Note: Array of Hashes
        let dictionary = [["image":"illustrationScreen-1",
                           "title":"SIMPLE ABROAD CALLS",
                           "subTitle":"Wonep converts international calls to local calls"],
                          ["image":"illustrationScreen-2",
                           "title":"FREE WONEP TO WONEP",
                           "subTitle":"if the person you're calling also has Wonep the call will be entirely free"],
                          ["image":"iIllustrationScreen-3",
                           "title":"NO HIDDEN CHARGES OR FEES",
                           "subTitle":"We have a very small charge for non-Wonep calls to mobiles or landlines"]]
        view = OnBoardingView.init(frame:UIScreen.main.bounds, inputViews:dictionary)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:: onBoardingView Protocol Functions
    
    func didTapNextButton() {
        
    }
    
    func didTapSkipButton() {
        
    }

}

