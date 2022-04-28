# SearchMeli

![](https://badgen.net/github/stars/SystangoTechnologies/Swift-MVVM-Boilerplate) ![](https://badgen.net/github/tag/SystangoTechnologies/Swift-MVVM-Boilerplate) ![](https://badgen.net/github/release/SystangoTechnologies/Swift-MVVM-Boilerplate) ![](https://badgen.net/github/issues/SystangoTechnologies/Swift-MVVM-Boilerplate) ![](https://badgen.net/github/license/SystangoTechnologies/Swift-MVVM-Boilerplate)

![ezgif com-gif-maker](https://user-images.githubusercontent.com/19338050/165677480-f5e99689-ee8c-49ae-a434-736a8886bc09.gif)





## Swift-MVVM-Combine

This project contains a test for MELI with MVVM architecture with all required podfiles and without storyboards.

## Features

- MVVM Architecture
- Services Layer
- Searchbar
- Screen Home
- Screen last searched
- Screen product list
- Screen product detail
- Icon & Tenmaple similar MELI
- Core date
- Carrousel


## Unit test

in the project can you see 6 unit tests, you can use text & idProduct in the file SearchMeliTests :

- testGetProduct : test services layer of the /sites/MCO/search?q={text}
- testGetProductById : test services layer of the  /items/{productId}
- testGetProducstError : test error in services layer of the  /sites/MCO/search?q={text}
- testGetProductByIdError : test services layer of the  /items/{productId}
- testProductListReceived : test viewModel for recevied list.
- testProductReceived : test viewModel for recevied single product.


## Requirements

- Xcode 12.x or above
- Swift 5

## Installation

You just need to install pods in case you are not getting that.

## Dependencies used

- [SnapKit](https://cocoapods.org/pods/SnapKit)
- [FSPagerView](https://cocoapods.org/pods/FSPagerView)
- [Kingfisher](https://github.com/onevcat/Kingfisher)




## Usage

- Rename the downloaded project with appropriate name
- Delete .xcworkspace file
- Update target name

## Contributors

[Julian Ramos - JART](https://www.linkedin.com/in/julian-ramos-trujillo-845203119/)

## License
MIT.
