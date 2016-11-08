//
//  UIFOnboardingView.swift
//  Pods
//
//  Created by Ranjith Kumar on 03/11/2016.
//  Copyright © 2016 F22Labs. All rights reserved.


public protocol UIFOnboardingViewProtocol:class {
    func pushNextScreen()
}

public class UIFOnboardingView: UIView,UIScrollViewDelegate {
    
   fileprivate var dataSource:[[String:String]]?
   fileprivate var scrollView:UIScrollView?
   fileprivate var pageControl:UIPageControl?
   fileprivate var nextButton:UIButton?
   fileprivate var skipButton:UIButton?
   fileprivate var imageViewArray = [UIImageView]()
   fileprivate var titleLabelArray = [UILabel]()
   fileprivate var subTitleArray = [UILabel]()
    
   public weak var delegate:UIFOnboardingViewProtocol?
    
    public override init(frame:CGRect) {
        super.init(frame:frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(iOS 8.2, *)
    public convenience init(dataSource:[Dictionary<String,String>]) {
        self.init()
        self.dataSource = dataSource
        self.createViews()
    }
    
    @available(iOS 8.2, *)
    fileprivate func createViews() {
        self.backgroundColor = .clear
        
        self.scrollView = UIScrollView()
        self.scrollView?.isPagingEnabled = true
        self.scrollView?.backgroundColor = .white
        self.scrollView?.delegate = self
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.bounces = false
        self.addSubview(self.scrollView!)
        
        self.pageControl = UIPageControl()
        self.pageControl?.pageIndicatorTintColor = UIColor.UIFrgba(fromHex: 0x15B4F1, alpha: 0.2)
        self.pageControl?.currentPageIndicatorTintColor = UIColor.UIFrgb(fromHex: 0x15B4F1)
        self.addSubview(self.pageControl!)
        
        self.nextButton = UIButton()
        self.nextButton?.setTitle("NEXT", for: .normal)
        self.nextButton?.setTitleColor(.white, for: .normal)
        self.nextButton?.backgroundColor = UIColor.UIFrgb(fromHex: 0x15B4F1)
        self.nextButton?.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        self.nextButton?.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        self.addSubview(self.nextButton!)
        
        self.skipButton = UIButton()
        self.skipButton?.setTitle("Skip", for: .normal)
        self.skipButton?.setTitleColor(.black, for: .normal)
        self.skipButton?.layer.cornerRadius = 8.0
        self.skipButton?.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
        self.skipButton?.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightLight)
        self.addSubview(self.skipButton!)
        
        for dictionary in self.dataSource! {
            let imageView = UIImageView()
            let image = UIImage(named: dictionary["image"]!)
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            self.imageViewArray.append(imageView)
            self.scrollView?.addSubview(imageView)
            
            let titleLabel = UILabel()
            titleLabel.text = dictionary["title"]
            titleLabel.textAlignment = .center
            titleLabel.numberOfLines = 1
            if UIScreen.main.bounds.height<600 {
                titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            }else {
                titleLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightRegular)
            }
            titleLabel.textColor = UIColor.UIFrgb(fromHex: 0x424242)
            self.scrollView?.addSubview(titleLabel)
            self.titleLabelArray.append(titleLabel)
            
            let subTitle = UILabel()
            subTitle.text = dictionary["subTitle"]
            subTitle.textAlignment = .center
            subTitle.numberOfLines = 0
            subTitle.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular)
            subTitle.textColor = UIColor.UIFrgba(fromHex: 0x424242, alpha: 0.55)
            self.scrollView?.addSubview(subTitle)
            
            self.subTitleArray.append(subTitle)
            
        }
    }
    
   public override func layoutSubviews() {
        super.layoutSubviews()
        var leftInset:CGFloat = 20.0
        let padding:CGFloat = 20.0
        var maxScrollHeight:CGFloat = 0.0
        
        for index in 0..<self.imageViewArray.count{
            let im = self.imageViewArray[index]
            im.frame = CGRect(x:leftInset, y:0, width:self.bounds.width-(2*padding), height:self.bounds.width-(2*padding))

            let title = self.titleLabelArray[index]
            title.sizeToFit()
            let titleHeight = max(title.bounds.height, 30)
            title.frame = CGRect(x:leftInset, y:im.frame.maxY+10, width:self.bounds.width-(2*padding), height:titleHeight)
        
            let subtTitle = self.subTitleArray[index]
            subtTitle.sizeToFit()
            let subTitleHeight = max(subtTitle.bounds.height, 30)
            subtTitle.frame = CGRect(x:leftInset, y:title.frame.maxY+10, width:self.bounds.width-(2*padding), height:subTitleHeight)
            
            leftInset = leftInset + self.bounds.width
            maxScrollHeight = max(maxScrollHeight, subtTitle.frame.maxY)
        }
        
        self.pageControl?.numberOfPages = self.imageViewArray.count
        
        let numberOfPages:CGFloat = CGFloat((self.pageControl?.numberOfPages)!)
        let scrollViewWidth = numberOfPages * self.bounds.width
        self.scrollView?.contentSize = CGSize(width:scrollViewWidth, height:maxScrollHeight)
        self.scrollView?.frame = CGRect(x:0, y:0, width:self.bounds.width, height:maxScrollHeight)
 
        let height:CGFloat = 40.0
        
        self.pageControl?.frame = CGRect(x:(self.bounds.width-60)/2, y:(self.scrollView?.frame.maxY)!+10, width:60, height:30)
        self.pageControl?.currentPage = 0
        
        self.nextButton?.frame = CGRect(x:(self.bounds.width-200)/2, y:(self.pageControl?.frame.maxY)!+10, width:200, height:height+10)
        self.nextButton?.layer.cornerRadius = (self.nextButton?.frame.height)!/2
        
        self.skipButton?.frame = CGRect(x:(self.bounds.width-200)/2, y:(self.nextButton?.frame.maxY)!+10, width:200, height:height+10)
    }
    
    //MARK:: UIScrollView Delegates
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let nextPage = floor(scrollView.contentOffset.x - pageWidth / 2) / pageWidth + 1
        self.pageControl?.currentPage = Int(nextPage)
        
    }
    
    //MARK:: Selectors
    @objc fileprivate func didTapNextButton() {
        if ((self.pageControl?.currentPage)!==self.imageViewArray.count-1) {
            self.delegate?.pushNextScreen()
        }else {
            let currentPage = CGFloat((self.pageControl?.currentPage)!)+1.0
            let x = currentPage * (self.scrollView?.frame.width)!
            self.pageControl?.currentPage = Int(currentPage)
            self.scrollView?.setContentOffset(CGPoint(x:x, y:0), animated: true)
        }
    }
    
    @objc fileprivate func didTapSkipButton() {
        guard (self.pageControl?.numberOfPages)!>0 else {
            return
        }
        let currentPage = CGFloat((self.pageControl?.numberOfPages)!)-1.0
        let x = currentPage * (self.scrollView?.frame.width)!
        self.scrollView?.setContentOffset(CGPoint(x:x, y:0), animated: true)
        self.pageControl?.currentPage = Int(currentPage)
        self.delegate?.pushNextScreen()
    }
    
}
