//import UIKit
//
//struct Contacts {
//    var phoneNumber: String
//    var email: String
//}
//
//class Person {
//    let name: String
//    private var contacts: Contacts
//    
//    var helloPhrase: String {
//        return "Hello!"
//    }
//    
//    init(name: String, contacts: Contacts) {
//        self.name = name
//        self.contacts = contacts
//    }
//    
//    convenience init(name: String, phoneNumber: String = "", email: String = "") {
//        self.init(
//            name: name,
//            contacts: Contacts(phoneNumber: phoneNumber, email: email)
//        )
//    }
//    
//    
//    public func changePhoneNumber(newPhone: String) {
//        self.contacts.phoneNumber = newPhone
//    }
//    
//    public func changeEmail(newEmail: String) {
//        self.contacts.email = newEmail
//    }
//    
//    internal func byPhrase() -> String {
//        return "By!"
//    }
//}
//
//class Teacher: Person {
//    private var expirienceGrade: Int = 0
//    
//    override var helloPhrase: String {
//        return "Hello, students!"
//    }
//    
//    override func byPhrase() -> String {
//        return "Good by, students!"
//    }
//    
//    public func upExpirienceGrade() {
//        expirienceGrade+=1
//    }
//    
//}
//
//class Student: Person {
//    private var homeWorksCount: Int = 0 // кол-во сданных домашних заданий
//    
//    override var helloPhrase: String {
//        return super.helloPhrase + " I'm ready to study :)"
//    }
//    
//    override func byPhrase() -> String {
//        return "Good by, everybody!"
//    }
//    
//    public func incrementHomeWorkCount() {
//        homeWorksCount+=1
//    }
//    
//}
//
//let someTeacher = Teacher(
//    name: "Antony",
//    phoneNumber: "1234567",
//    email: "Antony@gmail.com"
//)
//
//let someStudent = Student(name: "Sam")
//
//print(someTeacher.byPhrase())
//print(someStudent.byPhrase())

//func firstNonConsecutive (_ arr: [Int]) -> Int? {
//  let arrLenght = arr.count - 2
//    print("arrLenght = \(arrLenght)")
//  for i in 0...arrLenght {
//      print("arr[i] = \(arr[i])")
//      print("arr[i+1] = \(arr[i+1])")
//    if (arr[i] != (arr[i+1] - 1) ) {
//      return arr[i+1]
//    }
//  }
//    return nil
//}
//
//let first = firstNonConsecutive([1,2,3,4,6,7,8])
//var ex = [ 4, 3,5]
//ex.sort()
//print(ex)


var dictionary = ["a": 1, "b": 2]


// Keeping existing value for key "a":
//dictionary.merge(["a": 3, "c": 4]) { (current, _) in current }
// ["b": 2, "a": 1, "c": 4]


// Taking the new value for key "a":
//dictionary.merge(["a": 5, "d": 6]) { (_, new) in new }
// ["b": 2, "a": 5, "c": 4, "d": 6]

dictionary.merge(["a": 3, "c": 4]){ $1 }

//launchEnvironment.merge(ProcessInfo.processInfo.environment) { $1 }
