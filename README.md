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
   We install 5 pods which are SVProgressHUD, Alamofire, Parse, Parse/UI, BCryptSwift.
        
   Once we have the Podfile setup go back to the terminal and enter "pod install", this will install all the necesary           requirements to run the project. Once the terminal is done go to the folder directory and from now on open the "SeniorProject.xcworkspace" file.
   
Once in that folder go into the info.plist and add the following to the Information Property List by hitting the plus icon.
Then in that new line that was created go into it and change it to "App Transport Security Settings", then again hit the   plus icon and add "Allow Arbitrary Loads" and change the drop down value menu to "YES".

## Compiling and running the App

In Xcode in the upper left hand corner you will see a 
![alt text](https://raw.githubusercontent.com/petemi09/projectname/branch/path/to/img.png)

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
