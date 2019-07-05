////  w6d5_ui_performance_testingUITests.swift
// Created: 2019-07-05
//


import XCTest

class w6d5_ui_performance_testingUITests: XCTestCase {

    var app:XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        app = XCUIApplication()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        
        

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddMeal() {
        // Use recording to get started writing UI tests.
        
       AddAMeal(mealName: "Burger", numberOfCalories: 300)
        
    }
    
    func testDeleteMeal() {
        deleteMeal(mealName: "Burger", numberOfCalories: 300)
    }
    
    func testShowMealDetail() {
        let text = "Burger - 300"
        XCUIApplication().tables.staticTexts[text].tap()
        sleep(1)
//        print(app.staticTexts.element(matching:.any, identifier:"detailViewControllerLabel").label)
       XCTAssertEqual(app.staticTexts["detailViewControllerLabel"].label, text)
        
    }
    
    func AddAMeal(mealName:String,numberOfCalories:Int) {
        app.navigationBars["Master"].buttons["Add"].tap()
        
        let addAMealAlert = app.alerts["Add a Meal"]
        let collectionViewsQuery = addAMealAlert.collectionViews
        collectionViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText(mealName)
        
        let textField = collectionViewsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.tap()
        textField.typeText(String(numberOfCalories))
        addAMealAlert.buttons["Ok"].tap()
    }
    
    func deleteMeal(mealName:String,numberOfCalories:Int) {
        let cellText = String("\(mealName) - \(numberOfCalories)")
        let staticText = app.tables.staticTexts[cellText]
        if staticText.exists {
            staticText.swipeLeft()
            app.tables.buttons["Delete"].tap()
        }
    }

}
