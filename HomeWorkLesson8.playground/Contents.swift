import UIKit

enum AppleDevice {
    case iPad
    case iPhone
    case macBook
    case appleWatch
    case iMac
    
    var screenSize: CGSize {
        switch self {
        case .appleWatch: return CGSize(width: 39, height: 46)
        case .iPad: return CGSize(width: 174.1, height: 250.6)
        case .iPhone: return CGSize(width: 77.6, height: 163)
        case .macBook: return CGSize(width: 304.1, height: 212.4 ) 
        case .iMac: return CGSize(width: 547, height: 461)
        }
    }
    
    var isPad: Bool {
        switch self {
        case .appleWatch: return false
        case .iPad: return true
        case .iPhone: return false
        case .macBook: return false
        case .iMac: return false
        }
    }
}

extension AppleDevice: CustomStringConvertible {
    var description: String {
        switch self {
        case .appleWatch: return "Apple Watch"
        case .iPad: return "iPad"
        case .iPhone: return "iPhone"
        case .macBook: return "MacBook"
        case .iMac: return "iPod"
        }
    }
}

//let myFirstAppleDevice = AppleDevice.macBook
//print("My first apple device was \(myFirstAppleDevice.description)")
//print("My first apple device screen size was \(myFirstAppleDevice.screenSize.width) x \(myFirstAppleDevice.screenSize.height)")
//print("Was my first apple device iPad? \(myFirstAppleDevice.isPad)")

let s = "String event name = \"registration.AcceptTerms\""
print(s.drop { $0 != Constants.parametersSeparator }
    .dropFirst()
    .trimmingCharacters(in: .whitespaces))

enum Constants {
    static let parametersSeparator: Character = "="}
