
[![HTTPFormRequest](https://github.com/rjstelling/HTTPFormRequest/blob/master/Resources/Hero.png)](#)

[![Swift](https://img.shields.io/badge/Swift-2.3-orange.svg?style=flat)](#)
[![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](#)
[![Platform](https://img.shields.io/badge/Platform-iOS,%20macOS%20&%20tvOS-lightgrey.svg?style=flat)](#)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://github.com/rjstelling/HTTPFormRequest/blob/master/LICENSE)

HTTPFormRequest is a micro iOS Dynamic Framework containing a Swift implementation of multipart/form-data request.

Build using Swift 5.3, Xcode 12.4, supports iOS 12.0+

# Installation

### Swift Package Manager
1. Navigate to `XCode project` > `ProjectName` > `Swift Packages` > `+ (add)`
2. Paste the url `https://github.com/LionheartApplications/HTTPFormRequest.git`
3. Select the needed targets.

### Carthage Installation

1. In your `Cartfile` add `github "LionheartApplications/HTTPFormRequest"`
2. Link the build framework with the target in your XCode project

For detailed instructions check the official Carthage guides [here](https://github.com/Carthage/Carthage)

### Manual Installation

1. Download the project and build the shared target called `HTTPFormRequest`
2. Add the product in the list of "embed frameworks" list inside your project's target or create a work space with PresentationKit and your project and link directly the product of HTTPFormRequest's target to your target "embed frameworks" list
