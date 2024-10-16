import UIKit



// MARK: the first task
func sum( _ a: Int, _ b: Int) -> Int{
    a+b
}

print(sum(5,4))



// MARK: the second task
func convertToString(_ inputData:(Int, String)) -> String {
    let result = String(inputData.0) + inputData.1
    print(result)
    return result
}

convertToString((5, "la-la-la"))



// MARK: the third task
func thirdTask(_ task: (() -> ())?, _ a: Int) {
    if a>0 {
        task?()
    }
}

var myVar1 : () -> Void = {
    print("Hello from Closure 1");
}
thirdTask( myVar1, 5)
thirdTask( myVar1, -5)
thirdTask( nil, 1)



// MARK: the forth task
func isLeapYear( _ year: UInt) -> Bool {
    return year%4 == 0
}

let currentYear : UInt = 2024
print("Is \(currentYear) year leap? \(isLeapYear(currentYear))")

let nextYear : UInt = 2025
print("Is \(nextYear) year leap? \(isLeapYear(nextYear))")
