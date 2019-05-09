# Track Tracking


[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues) [![IOS 10.0+](https://img.shields.io/badge/IOS-10.0-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)

This is the repository to the mobile side of the Track Tracking application. This is intended for track athletes to keep track of thier times and record them. This application is written in Swift and is compiled in xcode, with swift v4.0. latest version of IOS that is compatiable is 10.0+.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites

What things you need to install the software and how to install them

### Xcode 10.0(or higher)
### cocopods

Xcode will be what you edit and compile the porject in
installing cocopods for extra 3rd party support

### Installing

A step by step series of examples that tell you how to get the IOS application running

first go out to apple.ccom and search fot the Xcode download
* [Xcode](https://developer.apple.com/xcode/) - IDE and compiler used to create this project

Then download the SeniorProject folder

once Xcode has been downloaded we then will need to go out to get our CocoPods for 3rd party support.
        all CocoPods can be found on [CocoPods](https://cocoapods.org)
        we will be using parse for our get and post requests.
        Using the terminal navigate to SeniorProject directory folder that you downloaded.
        Once there we will create a Pod file. This is done by typing in "pod init" into the command line.
        Once the command line is done go to that directory folder and open Podfile.
        This took me a while to finally figure out but all we need is to keep the target location, you can go ahead
        and remove the rest.
        
   When we are done this is what our Podfile will look like 
   
        ````
        platform :ios, '10.0'
        #     use_frameworkds!

        target 'SeniorProject' do
        use_frameworks!

        pod 'SVProgressHUD'
        pod 'Alamofire'
        pod 'Parse'
        pod 'Parse/UI'
        pod "BCryptSwift"

        end
        ````
   Then save the file!
   We install 5 pods which are SVProgressHUD, Alamofire, Parse, Parse/UI, BCryptSwift.
        
   Once we have the Podfile setup go back to the terminal and enter "pod install", this will install all the necesary           requirements to run the project. Once the terminal is done go to the folder directory and from now on open the "SeniorProject.xcworkspace" file.
   
Once in that folder go into the info.plist and add the following to the Information Property List by hitting the plus icon.
Then in that new line that was created go into it and change it to "App Transport Security Settings", then again hit the   plus icon and add "Allow Arbitrary Loads" and change the drop down value menu to "YES" (example below).

![alt text](https://github.com/petemi09/SeniorProjectMobile/blob/master/Other%20Projects%20that%20helped%20me%20create%20this%20application/Screen%20Shot%202019-05-09%20at%209.01.56%20AM.png)

## Compiling and running the App

In Xcode in the upper left hand corner you will see a play button select what version of Iphone you would like to simulate (example Iphone XR) and hit the play button to compile and run the project

![alt text](https://github.com/petemi09/SeniorProjectMobile/blob/master/Other%20Projects%20that%20helped%20me%20create%20this%20application/Screen%20Shot%202019-05-09%20at%209.01.27%20AM.png)

thats it the simulator will begin to run and then the app will launch. Have fun with this project feel free to add and modify to your prefrences. You should be greeted with the Login ViewController.

![alt text](https://github.com/petemi09/SeniorProjectMobile/blob/master/Other%20Projects%20that%20helped%20me%20create%20this%20application/Screen%20Shot%202019-05-09%20at%204.14.05%20PM.png)

## Deployment

Intital deployment was Iphone XR, firmware 12.0, swift 4.0

## Built With

* [Xcode](https://developer.apple.com/xcode/) - IDE
* [CocoPods](https://cocoapods.org) - Dependency Management


## Creator
* **Mitchell Petellin** - *SeniorProject* - [Github](https://github.com/petemi09)


## License

This project is licensed under the Apple License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Apple Documents
* Udemey
* Stack Overflow
* And the almighty Youtube
