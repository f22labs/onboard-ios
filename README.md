# onboarding

[![CI Status](http://img.shields.io/travis/ranjithatF22Labs/onboarding.svg?style=flat)](https://travis-ci.org/ranjithatF22Labs/onboarding)
[![Version](https://img.shields.io/cocoapods/v/onboarding.svg?style=flat)](http://cocoapods.org/pods/onboarding)
[![License](https://img.shields.io/cocoapods/l/onboarding.svg?style=flat)](http://cocoapods.org/pods/onboarding)
[![Platform](https://img.shields.io/cocoapods/p/onboarding.svg?style=flat)](http://cocoapods.org/pods/onboarding)

## Description
**Onboarding** will show off your Applicaton Flow. It will help user understand and quick intro of your application.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

**UIFOnboardingViewController** works as a normal controller, just instantiate it and present it.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
if(self.window == nil) {
self.window = UIWindow()
}
var dictionary = [Dictionary<String,String>]()
dictionary = [["imageName":"illustrationScreen-1",
"title":"SIMPLE ABROAD CALLS",
"subTitle":"Wonep converts international calls to local calls"],
["imageName":"illustrationScreen-2",
"title":"FREE WONEP TO WONEP",
"subTitle":"if the person you're calling also has Wonep the call will be entirely free"],
["imageName":"iIllustrationScreen-3",
"title":"NO HIDDEN CHARGES OR FEES",
"subTitle":"We have a very small charge for non-Wonep calls to mobiles or landlines"]]

let onboardingVC = UIFOnboardingViewController.init(dataSource:dictionary, hideStatusBar: true)
onboardingVC.delegate = self
let navigationController = UINavigationController.init(rootViewController: onboardingVC)
self.window?.backgroundColor = .white
self.window?.rootViewController = navigationController
self.window?.makeKeyAndVisible()
return true
}

```


## Requirements

## Installation

onboarding is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'onboarding 0.1.5'
```

## Author

ranjith@f22labs.com

## License

onboarding is available under the MIT license. See the LICENSE file for more info.
