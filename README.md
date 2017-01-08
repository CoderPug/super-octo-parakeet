# README

Demo code-challenge project for Hubchat.

Implemented using Swift 3

Features included

- Core : Connection manager. ( JSON + Image )
- Core : Basic unit testing.
- Showing Forum Info.
- Listing Forum Posts.
- Layout with autolayout constraints. ( No xibs nor storyboards )

####Build instructions

CodeChallengeCore project uses Carthage as dependency manager. 
Main project CodeChallenge uses CocoaPods ( requested as part of the task ) as dependency manager.

a) For the CodeChallengeCore project. Locate under the path
`/CodeChallenge/CodeChallengeCore/` 
and run 
`carthage update --platform iOS --no-use-binaries`

b) Later locate in the main path 
`/CodeChallenge/` 
and run
`pod install`

**UPDATE!**

There is a current problem when trying to build on real device under the specified configuration. The cocoaframework won't build properly linking the binaries from Carthage.

To solve this issue temporarily I opened a support branch 
`feature/stabilization-real-device `
where there is no cocoaframework. There is just one main project and it handles the dependencies under Carthage. 
This should be the branch to be used for real device testing.



####Development configuration

Xcode 8.2

####Third-Party Libraries

- Alamofire
- AlamofireImage
- SwiftyJSON
- SnapKit
- PromiseKit

###Demo

![](http://i.imgur.com/qpJPh3M.gif)
