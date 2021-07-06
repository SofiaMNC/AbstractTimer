# **Awesome Abstract Timer**
*Sofia Chevrolat (June 2021)*

[![forthebadge](https://forthebadge.com/images/badges/made-with-swift.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

> NB : This project has been carried out for the Slumber Group's Challenge.
___


## **Overview**
This app contains a single view controller with the following views and functionalities:

_Views_
- A red square in the top left corner
- A white rectangle in the middle of the screen
- A purple rectangle in the white rectangle
- A blue square in the bottom right corner
- A timer in the bottom left corner

_Functionalities_

- On tap on the white or purple rectangle:
    - the white and purple rectangles resize
    - the timer restarts

- In landscape mode, the purple rectangle disappears.

- The app has been localized to French and uses DateComponentsFormatter as much as possible to garantee the correct locale presentation of the timer's digits.

- The app supports the following accessibility settings:
    - Voice Over
    - Dynamic Type
    - Bold Text

_Testing_

The app comes with a set of tests and UI tests to validate its behavior.

![](https://img.shields.io/badge/coverage-88.8%25-green)

___

## **Requirements**

![](https://img.shields.io/badge/iOS-14%20or%20greater-brightgreen)
![](https://img.shields.io/badge/SnapKit-v%205.0.1-blueviolet)
![](https://img.shields.io/badge/Swift-5%20or%20greater-orange)

___

## **Usage**

- Open the project in Xcode and run the code.
- Run the tests

> **NB: A special UI test case has been created with the name _"DeliverableScenarioInAction.swift"_, to enable easy visualization of the requested test scenario**, asked to be delivered as a film in the requirements.

> **Running this UI test will actually execute and display the scenario in the simulator.**

___

## **Detailed description**

### **Requirements ✅**

All requirements as expressed in the attached document have been respected in terms of:

_Functionality_ 
- initial positioning of all the views 
- correct resizing of the white and purple rectangles on tap
- restart of the timer on tap
- localization of the app's content (to French) using a Localizable.strings file

_Programming Concepts and Techniques_ 
- Composition
- Object Oriented Design (classes, inheritance)
- Protocols
- Auto Layout with Safe Area
- Trait Collections
- Accessibiltiy

### **Additional implementation details 🎁**

- The code follows an MVVM architecture
- Tests and UITests have been implemented with a 88.8% coverage as indicated by Xcode

