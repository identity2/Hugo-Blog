---
title: "Build & Test Automation for Xcode Projects Using Travis CI"
date: 2017-07-08T18:47:00+08:00
thumbnail: ""
static_page: false
draft: false
---
Testing your code is a vital process in app development, since it could reveal bugs and mistakes before the users actually use it. However, testing your app whenever you make a commit can be tedious and time-consuming. This is where Continuous Integration (CI) comes to rescue.

## Continuous Integration
Continuous Integration is the process of building and testing your app automatically, saving precious time for the developers. In this article, I will demonstrate how to integrate Travis CI to your XCode projects (to be specific, iOS/macOS/tvOS/watchOS projects) on GitHub.

## Starting Up a GitHub Repo
Start a new XCode project and initialize a local Git repository by:

{{< highlight bash >}}
git init
{{< / highlight >}}

Then do the typical Git workflow to push this on your remote GitHub repo (make sure you have created a new repo on GitHub):

{{< highlight bash >}}
git add -all
git commit -m "Start a new project."
git remote add origin https://github.com/your_username/your_repo.git
{{< / highlight >}}

## Activate Travis on GitHub
Now it's time to integrate Travis to your GitHub repo. Go to the [official website of Travis CI](https://travis-ci.org) and hit the "Sign in with GitHub" button on the upper right corner. Log in using your GitHub account. You will find your GitHub avatar picture appearing on the upper right corener of the webpage if you logged in successfully. Click your avatar picture and you will see all of your GitHub repos.

![Pic-1](/posts/build-test-automation-for-xcode-projects-using-travis-ci/1.png)

Click on the switch located on the left of your repo to turn it on. A green check will appear, meaning Travis is now monitoring this repo.

![Pic-2](/posts/build-test-automation-for-xcode-projects-using-travis-ci/2.png)

## Configuring Travis CI
You can now try to commit and push your changes on the Travis-activated GitHub repo, but the test will fail because the configuration file is missing. Locate your local project in the Terminal, and edit (add) a plain text file named `.travis.yml`:

{{< highlight bash >}}
vi .travis.yml
{{< / highlight >}}

Terminal will now open the file up with the Vi text editor. Add the following lines as the configuration, and type `:wq` to save and quit Vi.

{{< highlight bash >}}
language: objective-c
osx_image: xcode8.3
script: xcodebuild -project ProjectName.xcodeproj -scheme ProjectName -sdk iphonesimulator10.3 -destination 'platform=iOS Simulator,OS=9.1,name=iPhone 6' -configuration Debug build test
{{< / highlight >}}

I will explain the configuration line by line.

<br />

**language** - No matter you are using Swift, Objective-C, or both in your project, Travis recognizes XCode projects with the value of `objective-c`. So don't worry if you are not using Objective-C in your project.

<br />

**osx-image** - This indicates which version of XCode tools you want your project to be built with. [Here is a list of the versions Travis provide](https://docs.travis-ci.com/user/languages/objective-c/#Supported-Xcode-versions)

<br />

**script** - You can decide which scripts you want Travis to run on the building & testing environment. By default, Travis CI uses `xctool` to build and test XCode projects. However, after XCode 8, many of the original commands are not supported by `xctool` anymore. As a result, I will use the plain old `xcodebuild` to build and test the project.

<br />

**-project** - This is the `.xcodeproj` file of your project. Note that if you are using CocoaPods, you should replece `xcode_project` with `xcode_workspace` and assign it with `ProjectName.xcworkspace` instead.

<br />

**-scheme** - You can decide which scheme you want to build and run by setting `-scheme`. Most of the time, you will set this to the default scheme, which is the same as your project name.

<br />

**-sdk** - Tests should be run on iOS simulators, so `-sdk` lets you decide which simulator you want your tests to be run on.

<br />

**-destination** - This should be set explicitly or `xcodebuild` will try to test the built project on *Generic iOS Device*, which will always fail.

<br />

## Configure XCode Scheme
Though the project is correctly configured for Travis CI, Travis still fails if you commit and push your changes now. This is because your scheme isn't shared on your GitHub repo. To solve this, open up your project in XCode and click **Edit Scheme**. Select the **Shared** checkbox below the *Edit Scheme* window, your project is now perfectly setup for Travis!

<br />

## Conclusion
Commit and push an arbitrary change to your GitHub repo. Wait for few minutes and you will see a small checkmark next to your commit code, meaning all tests for Travis has passed.

![Pic-3](/posts/build-test-automation-for-xcode-projects-using-travis-ci/3.png)

Click on it and you can see all the output messages on the building environment. Since we are using `xcodebuild`, the output message is quite bulky. Scroll to the very bottom, you will find all your test cases.

{{< highlight bash>}}
Test Case '-[ProjectNameTests.ProjectNameTests testExample]' started.
Test Case '-[ProjectNameTests.ProjectNameTests testExample]' passed (0.006 seconds).
Test Case '-[ProjectNameTests.ProjectNameTests testPerformanceExample]' started.
...
...
...
** TEST SUCCEEDED **
{{< / highlight >}}

This is the basic way to integrate Travis CI with your XCode project. Hope it will save your precious time and boost your development speed. Bye! :D