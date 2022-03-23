# Change Log

- Clean Swift version 3.0.2를 Coway에서 수정한 버전입니다.

## 1.0.0
- Fixed @testable import for project names containing spaces
- Added example unit tests for the sample use case in:
    - View controller
    - Interactor
    - Presenter
- Updated for the latest Xcode 8.3.3 and Xcode 9.0 beta
- Updated to work with Swift 3 and Swift 4
- Improved routing whether you use segues or not
- Improved data passing using the all new data store protocol
- Separated the routing process into two phases: navigation and data passing, with a clean interface
- Removed the need for configurator in favor of cleaner setup
- Combined input and output protocols to remove duplication
- Renamed protocols with better names
- Swiftier models with nested enums and structs
- Use optionals to prevent crash in the VIP cycle when the scene is no longer in memory
- Works whether you use storyboards to build your UI or not
- View controller class names are now recognized when specifying class names in storyboards
