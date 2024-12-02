struct PersonData {
    let name: String
    let surname: String
    let patronymic: String
    
    let address: String
    let position: String
    
    func fullName() -> String {
        return "\(surname) \(name) \(patronymic)"
    }
}

