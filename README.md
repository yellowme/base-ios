# Yellow Pod

This is a base project skeleton used on our iOS projects. You can refer here to build your own project structure when a new project begin

## Requirements

* Xcode 9 or above
* iOS 11 or above

## How To Use?

### Get the YellowPod

#### 1. First clone this repo

``` bash
git clone git@github.com:yellowme/base-ios.git
```

#### 2. Open the Xcode project using `YellowPod/YellowPod.xcworkspace` only

#### 3. Learn about our `project structure` [here](./YellowPod/README.md)

### Create your own project

#### 1. Open the Xcode and create a `Single View App` project

Considerations:

* When you select the name for your project make sure you are using capitalized words. Examples: *Wawa*, *Kiiwk*, *Semple*.
* The bundle identifier for the company is `mx.yellowme`.
* Make sure the options `Include UI Tests` and `Include Unit Tests` are checked.

#### 2. Make sure to add a proper `.gitignore` file to the project. You can use [this one](./YellowPod/.gitignore)

#### 3. (Optional) Relocate auto generated files when creating a new project

To follow a better structure, you could relocate the `Info.plist` file going to project `Build Settings` under `Packaging` section find the `Info.plist File` config. The `Build Settings` sections is inside the project details and you can access by clicking the blue/white icon which represents the project on your Xcode left panel.

#### 4. Prepare the project to support `CocoaPods`

*Note:* Install cocoapods support https://cocoapods.org/

Open your terminal and locate on your project folder. Now you need to tnitialize the pod support by executing:

``` bash
pod init
```

This would create a `Podfile` on the project root. *Note:* Remember this file is not visible on the Xcode until now.

Add the following dependencies to the `Podfile`:

* Alamofire
* SDWebImage
* SwiftyJSON
* DefaultsKit

You could use [this file](./YellowPod/Podfile) as reference.

After adding the dependencies execute:

``` bash
pod install
```

#### 5. After installing dependencies, close the Xcode and **reopen the project** but always using the recently generated workspace file `YourProjectName/YourProjectName.xcworkspace`

#### 6. The last step is to copy the sources from this library onto your project

You could achieve this in two ways:

1. *Right click* above your main project folder and select `Add Files to "ProjectName"..` and select the folder `Support` from the `YellowPod` library wherever you downloaded it.
2. Drag and drop the `Support` folder onto the Xcode and select the `Create groups` option on the prompted dialog.

## Development Team

* [Luis Burgos](https://github.com/LuisBurgos)
