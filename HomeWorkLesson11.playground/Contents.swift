import UIKit

struct Contacts {
    var phoneNumber: String
    var email: String
}

class Person {
    let name: String
    private var contacts: Contacts
    
    var helloPhrase: String {
        return "Hello!"
    }
    
    init(name: String, contacts: Contacts) {
        self.name = name
        self.contacts = contacts
    }
    
    convenience init(name: String, phoneNumber: String = "", email: String = "") {
        self.init(
            name: name,
            contacts: Contacts(phoneNumber: phoneNumber, email: email)
        )
    }
    
    
    public func changePhoneNumber(newPhone: String) {
        self.contacts.phoneNumber = newPhone
    }
    
    public func changeEmail(newEmail: String) {
        self.contacts.email = newEmail
    }
    
    internal func byPhrase() -> String {
        return "By!"
    }
}

class Teacher: Person {
    private var expirienceGrade: Int = 0
    
    override var helloPhrase: String {
        return "Hello, students!"
    }
    
    override func byPhrase() -> String {
        return "Good by, students!"
    }
    
    public func upExpirienceGrade() {
        expirienceGrade+=1
    }
    
}

class Student: Person {
    private var homeWorksCount: Int = 0 // кол-во сданных домашних заданий
    
    override var helloPhrase: String {
        return super.helloPhrase + " I'm ready to study :)"
    }
    
    override func byPhrase() -> String {
        return "Good by, everybody!"
    }
    
    public func incrementHomeWorkCount() {
        homeWorksCount+=1
    }
    
}

let someTeacher = Teacher(
    name: "Antony",
    phoneNumber: "1234567",
    email: "Antony@gmail.com"
)

let someStudent = Student(name: "Sam")

print(someTeacher.byPhrase())
print(someStudent.byPhrase())
