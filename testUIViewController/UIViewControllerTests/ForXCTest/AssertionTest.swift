//
//  AssertionTest.swift
//  UIViewControllerTests
//
//  Created by Лилия Д. Юмакаева on 08.11.2024.
//

import XCTest

final class AssertionTest: XCTestCase {
    
    func testExample() {
        print(findDigit(5432, 3))
//        continueAfterFailure = true
//        
//        XCTAssertEqual(1, 2)
//        XCTAssertTrue(false, "первая проверка")
//        XCTAssertTrue(false, "вторая проверка")
//        continueAfterFailure = false
//        
//        XCTAssertEqual(1, 2)
//        XCTAssertTrue(false, " after первая проверка")
//        XCTAssertTrue(false, "after вторая проверка")
//        
//        continueAfterFailure = true
//        
//        XCTAssertEqual(1, 2)
//        XCTAssertTrue(false, "after after первая проверка")
//        XCTAssertTrue(false, "after after вторая проверка")
    }
     
    func findDigit(_ num:Int, _ nth: Int) -> Int {
        if (nth > 0) {
            let s = String(abs(num))
            let tmp = String(s.reversed())
            let resultEn = tmp.enumerated().first(where: { $0.offset == (nth-1) })
            let result = String(resultEn?.element ?? "0")
            return Int(result) ?? 0
        } else {
            return -1
        }
    }
    
    func testExample2() {
        print(findDigit(5432, 2))
    }
        
        
//      let s = String(abs(num))
//      if (s.count < nth ) {
//        let tmp = String(s.reversed())
//        let result = tmp.index(tmp.startIndex, offsetBy: (nth-1))
//          return result
//      } else {
//        return 0
//      }
//    }
    
    

}
