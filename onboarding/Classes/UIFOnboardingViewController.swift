//
//  UIFOnboardingViewController.swift
//  Pods
//
//  Created by Ranjith Kumar on 07/11/2016.
//  Copyright © 2016 F22Labs. All rights reserved.

/**
 *  The UIFOnboardingViewControllerProtocol is adopted by an object that mediates the application’ rootviewcontroller to UIFOnboadingviewcontroller.
 */
@objc public protocol UIFOnboardingViewControllerProtocol:class {
    /**
     This func will intimate to application after completing the onboard screens
     */
    func didFinishInstructions()
}

open class UIFOnboardingViewController: UIViewController,UIFOnboardingViewProtocol {

    fileprivate var dataSource:[Dictionary<String,String>]?
    fileprivate var statusBarHidden: Bool?
    
    fileprivate  var myView: UIFOnboardingView! { return self.view as! UIFOnboardingView }

    @objc open weak var delegate:UIFOnboardingViewControllerProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public convenience init(dataSource:[Dictionary<String,String>],hideStatusBar:Bool) {
    self.init()
        if #available(iOS 8.2, *) {
            self.dataSource = dataSource
            self.statusBarHidden = hideStatusBar
        } else {
            // Fallback on earlier versions
        }
    }
    
    override open func loadView() {
        super.loadView()
        if #available(iOS 8.2, *) {
            view = UIFOnboardingView.init(dataSource:dataSource!)
            self.myView.delegate = self
            self.edgesForExtendedLayout = []
            self.navigationController?.navigationBar.isHidden = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open var prefersStatusBarHidden: Bool {
        return self.statusBarHidden!
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    // MARK:: UIFOnboardingViewControllerProtocol Functions
    open func pushNextScreen() {
        self.delegate?.didFinishInstructions()
    }
}
