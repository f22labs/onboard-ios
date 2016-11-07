//
//  F22InstructorScene.swift
//  Pods
//
//  Created by Ranjith Kumar on 07/11/2016.
//  Copyright © 2016 F22Labs. All rights reserved.


import UIKit

public protocol F22InstructorSceneProtocol:class {
    func didFinishInstructions()
}

public class F22InstructorScene: UIViewController,F22onBoardingViewProtocol {

    var myView: F22onBoardingView! { return self.view as! F22onBoardingView }
    
    var inputViews:[Dictionary<String,String>]?
    var nextViewController:UIViewController?
    var statusBarHidden: Bool?
    weak var delegate:F22InstructorSceneProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public convenience init(inputViews:[Dictionary<String,String>],nextViewController:UIViewController,hideStatusBar:Bool) {
    self.init()
        if #available(iOS 8.2, *) {
            self.nextViewController = nextViewController
            self.inputViews = inputViews
            self.statusBarHidden = hideStatusBar
        } else {
            // Fallback on earlier versions
        }
    }
    
    override public func loadView() {
        super.loadView()
        if #available(iOS 8.2, *) {
            view = F22onBoardingView.init(inputViews:self.inputViews!)
            self.myView.delegate = self
            self.edgesForExtendedLayout = []
        } else {
            // Fallback on earlier versions
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override public var prefersStatusBarHidden: Bool {
        return self.statusBarHidden!
    }

    // MARK:: F22InstructorSceneProtocol Protocol Functions
    public func pushNextScreen() {
        self.navigationController?.viewControllers = [self.nextViewController!]
        self.delegate?.didFinishInstructions()
    }
}
